class RejectsController < ApplicationController
  before_action :require_user_logged_in
  def create
    user = User.find(params[:reject_id])
    current_user.refuse(user)
    flash[:success] = 'ユーザをブロックしました。'
    redirect_to user
  end

  def destroy
    user = User.find(params[:reject_id])
    current_user.unrefuse(user)
    flash[:success] = 'ユーザのブロックを解除しました。'
    redirect_to user
  end
end
