class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  	@users = User.all
  end
  def new
    @user = User.new
  end
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books.reverse_order
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  end
  private
  def user_params
  	params.require(:user).permit(:name, :profile_image)
  end
end
