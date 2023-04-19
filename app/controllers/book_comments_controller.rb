class BookCommentsController < ApplicationController

  def create
   book = Book.find(params[:book_id])
  # comment = current_user.book_comments.new(book_comment_params)
   comment = BookComment.new(book_comment_params)
   comment.user_id = current_user.id
   comment.book_id = book.id
   comment.save
   @book = Book.find(params[:book_id])
   @book_comment = BookComment.new
  # redirect_to book_path(book) ※非同期処理により削除
  end

  def destroy
   BookComment.find(params[:id]).destroy
  # redirect_to book_path(params[:book_id]) ※非同期処理により削除
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
