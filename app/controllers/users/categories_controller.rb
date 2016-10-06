class Users::CategoriesController < ApplicationController
  def index
    @categories = current_user.tags
  end

  def new
    current_user.categories.build if current_user.categories.size == 0
  end

  def create
  end

  def destroy
  end
end
