class ToppagesController < ApplicationController
  def index
    @posts = current_user.feed_posts.order(id: :desc)
  end
end
