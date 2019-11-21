class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy, :show]
  before_action :correct_user, only: [:destroy]
  def create
    @post = current_user.posts.build(post_params)
    
    if @post.save
      flash[:success] = '無事に投稿できました。'
      redirect_to root_url
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end
  
  private

  def post_params
    params.require(:post).permit(:content, :image1, :image2, :image3, :image4, :joy, :angry, :sad, :happy)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
