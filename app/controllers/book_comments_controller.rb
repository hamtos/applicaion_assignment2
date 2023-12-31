class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comment.new(book_comment_params)
    @book_comment.book_id = @book.id
    if @book_comment.save
    else
      render template: 'books/show'
    end

  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = @book.book_comment.find(params[:id])
    book_comment.destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:body, :user_id, :book_id)
  end
end
