class BooksController < ApplicationController

before_action :authenticate_user!

  def show
  	@book = Book.find(params[:id])
  	@user = @book.user
  end

  def index
  	@book = Book.new
  	@books = Book.all
  	@user = current_user
  	@users = User.all
  end

  def create
  	book = Book.new(book_params)
  	book.user_id = current_user.id

    if book.save
  	   flash[:notice] = "Book was successfully created"
  	   redirect_to book_path(book.id)
  	 else
  	 	flash[:error] = book.errors.full_messages
  	   redirect_to mypage_path(current_user.id)
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	 book = Book.find(params[:id])
    if book.update(book_params)
  	   flash[:notice] = "Book was successfully updated"
  	   redirect_to book_path(book.id)
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end