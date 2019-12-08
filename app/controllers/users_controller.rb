class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.order(id: "DESC")
    counts(@user)
    emotion
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'プロフィールを更新しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィールを更新できませんでした。'
      render :edit
    end
  end

  def destroy
  end
  
  def joy
    @user = User.find(params[:id])
    @posts = @user.posts.where(joy: true).order(id: "DESC")
    emotion
  end
  
  def angry
    @user = User.find(params[:id])
    @posts = @user.posts.where(angry: true).order(id: "DESC")
    emotion
  end
  
  def sad
    @user = User.find(params[:id])
    @posts = @user.posts.where(sad: true).order(id: "DESC")
    emotion
  end
  
  def happy
    @user = User.find(params[:id])
    @posts = @user.posts.where(happy: true).order(id: "DESC")
    emotion
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :image)
  end
  
  def emotion
    @joy = @user.posts.where(joy: true).count
    @angry = @user.posts.where(angry: true).count
    @sad = @user.posts.where(sad: true).count
    @happy = @user.posts.where(happy: true).count
    @chart = [['よろこび', @joy], ['いかり', @angry], ['かなしい', @sad], ['うれしい', @happy]]
  end
end
