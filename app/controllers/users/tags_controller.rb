class Users::TagsController < ApplicationController
  def index
    @tags = current_user.tags
  end

  def new
    current_user.tags.build if current_user.tags.size == 0
  end

  def create
    current_user.update(tag_params)
    respond_with current_user, location: users_tags_path, method: :get
  end

  private

  def tag_params
    params.require(:user).permit(
      tags_attributes: [:id, :name, :_destroy]
    )
  end
end
