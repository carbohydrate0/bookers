class BooksController < ApplicationController
  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created!'
    else
      render :index
    end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated!'
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path(book)  # 投稿一覧画面へリダイレクト
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
