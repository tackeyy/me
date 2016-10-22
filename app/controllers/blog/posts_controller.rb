class Blog::PostsController < ApplicationController
  before_action :set_categories, only: [:index, :show]

  def index
    @posts = Post.all.decorate
  end

  def show
    @post = Post.find(params[:id]).decorate
  end

  private

  def set_categories
    @categories = Category.all
  end
end
