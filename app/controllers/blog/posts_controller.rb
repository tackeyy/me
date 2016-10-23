class Blog::PostsController < ApplicationController
  before_action :set_categories, only: [:index, :show]

  def index
    @posts = admin.posts.decorate
    @tags = admin.posts.tag_counts_on(:tags).order('count DESC')
    @recent_posts = @posts[0..Post::RECENT_POSTS_CONT]
  end

  def show
    @post = admin.posts.find(params[:id]).decorate
  end

  def tag_cloud
    @tags = Post.tag_counts_on(:tags).order('count DESC')
  end

  private

  def set_categories
    @categories = admin.categories.all
  end
end
