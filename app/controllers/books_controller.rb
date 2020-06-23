class BooksController < ApplicationController
  def create
    @user = User.find(current_user.id)
    @book = Book.new(post_book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to book_path(@book.id), notice: "You have creatad book successfully."
    else
      session[:error] = @book.errors.to_a
      redirect_to books_path
    end
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
    @book = Book.find(params[:id])
    if @book.update(post_book_params)
      @book = Book.new
      redirect_to book_path(params[:id]), notice: "You have updated book successfully."
    else
      render :edit
    end
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
