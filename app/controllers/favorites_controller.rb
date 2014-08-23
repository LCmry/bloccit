class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    if favorite.save
      flash[:notice] = "Post favorited."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Error favoriting post."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    if favorite.destroy
      flash[:notice] = "Unfavorited"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Error unfavoriting post."
      redirect_to [@post.topic, @post]
    end
  end
end
