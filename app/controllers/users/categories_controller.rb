class Users::CategoriesController < ApplicationController
  before_action :require_login

  def index
    @categories = current_user.categories
  end

  def new
    current_user.categories.build if current_user.categories.empty?
  end

  def create
    current_user.update(category_params)
    respond_with current_user, location: users_categories_path, method: :get
  end

  private

  def category_params
    params.require(:user).permit(
      categories_attributes: [:id, :parent_id, :name, :_destroy]
    )
  end
end
