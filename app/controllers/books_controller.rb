class BooksController < ApplicationController
  def create
    @book = Book.new(post_book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id);
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @b = Book.find(params[:id])
    @b.update(post_book_params)
    @book = Book.new
    redirect_to book_path(params[:id])
  end

  def destroy
    @b = Book.find(params[:id])
    @b.destroy
    redirect_to books_path
  end

  def show
    @book = Book.new
    @b = Book.find(params[:id])
    @user = User.find(@b.user_id)
    @books = Book.all
  end

private
  def post_book_params
    logger.info "title:#{:title}"
    logger.info "body:#{:body}"
    params.require(:book).permit(:title, :body)
  end
end
