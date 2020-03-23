class BooksController < ApplicationController
	def new
	end

	def create
	  	@book = Book.new(book_params)
	  	@book.user_id = current_user.id
	  	if @book.save
	      flash[:notice] = 'successfully'
	      redirect_to book_path(@book.id)
	    else
	      @books = Book.all
	      render :show
	    end
	end

	def index
	end

	def show
	end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
