class UsersController < ApplicationController

before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books.all
  end

  def index
  	@user = User.new
  	@users = User.all
  	@user = current_user
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
    if @user!=current_user
       redirect_to mypage_path(current_user.id)
    end
  end

  def create
  	@user = User.new(user_params)
  	@user.user_id = current_user.id
    @user.save
  	 redirect_to edit_user_path
  end

  def update
  	  user = User.find(params[:id])
    if user.update(user_params)
       flash[:notice] = "User was successfully updated"
  	   redirect_to mypage_path(current_user.id)
  	else
  	 	flash[:error] = user.errors.full_messages
  	  redirect_to edit_user_path(user.id)
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :image)
  end

end
