class CommentsController < ApplicationController
  
  before_action :require_user_logged_in
  
  def create
  
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
      @post.create_notification_comment!(current_user, @comment.id)
      flash[:success] = '無事にコメントできました。'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = 'コメントに失敗しました。'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def index
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :joy, :angry, :sad, :happy, :image1, :image2, :image3, :image4)
  end
end
