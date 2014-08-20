class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post, @comment]
    else
      flash[:error] = "There was an error saving the comment.  Please try again."
      render :create
    end
  end
end
