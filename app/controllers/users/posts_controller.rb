class Users::PostsController < ApplicationController
  def index
    @posts = current_user.posts
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
  end

  def update
  end

  def destroy
  end
end
