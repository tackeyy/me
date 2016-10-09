class Users::PostsController < ApplicationController
  def index
    @posts = current_user.posts.decorate
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)
    respond_with @post, location: users_posts_path
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
