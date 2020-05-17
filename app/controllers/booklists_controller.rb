class BooklistsController < ApplicationController
  def create
    book = Book.new(book_params)
    if book.save then
      redirect_to book_path(book.id), notice: "successfully"
    else
      @books = Book.order('id ASC')
      @book = book
      render :index
    end
  end

  def index
    @books = Book.order('id ASC')
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params) then
      redirect_to book_path(book.id), notice: "successfully"
    else
      @book = book
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to booklists_path, notice: "Book was successfully destroyed."
  end

  private

  def book_params
      params.require(:book).permit(:title, :body)
  end
end
