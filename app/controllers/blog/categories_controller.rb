class Blog::CategoriesController < ApplicationController
  def show
    @category = admin.categories.find(params[:id])
    @categories = admin.categories.all
    @posts = Kaminari.paginate_array(
      admin.posts.where(category_id: params[:id]).decorate
    ).page(params[:page])
    @tags = admin.posts.tag_counts_on(:tags).order('count DESC')
    @recent_posts = @posts[0..Post::RECENT_POSTS_CONT]
  end
end
