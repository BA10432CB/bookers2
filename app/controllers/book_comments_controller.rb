class BookCommentsController < ApplicationController
  def create
    @book_show = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book_show.id
    @book_comment.save
  end

  def destroy
    target_book_comment = BookComment.find(params[:id])
    @book_show = target_book_comment.book
    target_book_comment.destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:book_id, :comment)
  end
end
