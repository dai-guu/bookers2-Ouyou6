class BookCommentsController < ApplicationController
  before_action :authenticate_user!

 def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.user_id = current_user.id
    @book_comment.save



 end


  def destroy
   @book = Book.find(params[:book_id])
   @book_comment = BookComment.find_by(params[:book_id])
   @book_comment.destroy
   @book_comment = BookComment.new
  end

  private

   def book_comment_params
    params.require(:book_comment).permit(:comment)
   end


end
