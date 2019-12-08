class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_posts = user.posts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_comments = user.comments.count
    @count_joy = user.posts.where(joy: true).count
    @count_angry = user.posts.where(angry: true).count
    @count_sad = user.posts.where(sad: true).count
    @count_happy = user.posts.where(happy: true).count
  end
end
