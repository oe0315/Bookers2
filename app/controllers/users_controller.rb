class UsersController < ApplicationController
	before_action :authenticate_user!
  def top
  end

  def index
  	@book = Book.new
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = Book.all
  end

  def create
  end

  def edit
  	@user = User.find(params[:id])
  	@users = User.all
    if @user.id == current_user.id

    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
  	 @user = User.find(params[:id])
    if @user.update(user_params)
    	flash[:notice] = 'successfully'
        redirect_to user_path(@user.id)
    else
    	render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
