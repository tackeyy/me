class Blog::PostsController < ApplicationController
  def index
    @posts = Post.all.decorate
  end

  def show
  end
end
