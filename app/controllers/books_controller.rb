class BooksController < ApplicationController
	before_action :authenticate_user!
	def new
	end

	def create
	  	@book = Book.new(book_params)
	  	@book.user_id = current_user.id
	  	@books = Book.all
	  	if @book.save
	      flash[:notice] = 'successfully'
	      redirect_to book_path(@book.id)
	    else
	      render 'index'
	    end
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	def show
		@book = Book.new
		@book_date = Book.find(params[:id])
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id == current_user.id

		else
			redirect_to books_path
		end
	end

	def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
  	  redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'index'
    end
	end



  private
  def book_params
  	params.require(:book).permit(:title, :body, :profile_image, :name)
  end
end
