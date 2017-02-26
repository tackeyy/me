class Users::PostsController < UserController
  before_action :require_login
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = current_user.posts.decorate
  end

  def show
  end

  def new
    @post = current_user.posts.build
    @categories = current_user.categories
  end

  def create
    @post = current_user.posts.create(post_params)
    respond_with @post, location: users_post_path(@post)
  end

  def update
    @post.update(post_params)
    respond_with @post, location: users_post_path(@post)
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
    permited_params = params.require(:post).permit(:title, :category_id, :body, :tag_list)
    # FIXME: tag_listが空になるため以下の処理を追加
    permited_params[:tag_list] = params[:post][:tag_list]
    permited_params[:status] = get_status
    permited_params
  end

  def get_status
    params[:commit] == I18n.t('enumerize.post.status.wip') ? 'wip' : 'published'
  end
end
