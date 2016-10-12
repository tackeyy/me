class Users::TagsController < ApplicationController
  def index
    @tag_names = current_user.tag_list
  end

  def new
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
