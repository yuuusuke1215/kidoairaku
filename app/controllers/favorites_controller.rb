class FavoritesController < ApplicationController
  
  before_action :require_user_logged_in
  
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    post.create_notification_like!(current_user)
    flash[:success] = 'お気に入りに登録しました。'
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    flash[:success] = 'お気に入りから削除しました。'
  end
end
