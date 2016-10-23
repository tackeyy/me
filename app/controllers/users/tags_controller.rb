class Users::TagsController < ApplicationController
  before_action :require_login

  def index
    @tags = current_user.tags.order('taggings_count DESC')
  end

  def new
  end

  def create
    current_user.update(tag_params)
    respond_with current_user, location: users_tags_path, method: :get
  end

  def list
    render json: current_user.tags.pluck(:name).to_json
  end

  private

  def tag_params
    params.require(:admin).permit(
      tags_attributes: [:id, :name, :_destroy]
    )
  end
end
