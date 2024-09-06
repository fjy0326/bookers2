class BooksController < ApplicationController
  def new
    @book　= Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books= Book.all
    if @book.save
     redirect_to book_path(@book.id)
    else 
     @books = Book.includes(:user).all
     @user = User.find(current_user.id)
     render :index
   end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to user_path(current_user.id)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    @books = Book.includes(:user).all
    @user = User.find(current_user.id)
    render :index
  end
  
  def index
    @books = Book.includes(:user).all
    @user = User.find(current_user.id)
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
