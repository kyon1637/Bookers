class UsersController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:edit]
  def top
  end
  def index
  	@users = User.all
    @user = User.new
    @book = Book.new
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.new
    @user = User.find(params[:id])
  end

  def show
    @book = Book.find_by(id: params[:id])
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books.reverse_order
  end

  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = 'You have updated user successfully.'
    redirect_to user_path(@user.id)
  else
    render :edit
  end
  end

   def follows
    @user = User.find(params[:id])
   end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers

   end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user.id)
    end
  end
end
