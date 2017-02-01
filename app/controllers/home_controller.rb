class HomeController < ApplicationController
  def index
    @posts = Post.order(:created_at).limit(Post::LATEST_POSTS_COUNT).decorate
  end
end
