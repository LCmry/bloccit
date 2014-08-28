class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
    else
      flash[:error] = "There was an error saving the comment.  Please try again."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to :back
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
