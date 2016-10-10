class Users::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

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
    @post.update(post_params)
    respond_with @post, location: users_posts_path
  end

  def destroy
    @post = @post.destroy
    respond_with @post, location: users_posts_path
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id]).decorate
  end

  def post_params
    permited_params = params.require(:post).permit(:title, :body)
    permited_params[:status] = get_status
    permited_params
  end

  def get_status
    params[:commit] == I18n.t('enumerize.post.status.wip') ? 'wip' : 'published'
  end
end
