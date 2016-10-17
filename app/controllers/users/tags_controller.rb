class Users::TagsController < ApplicationController
  before_action :require_login

  def index
    @tag_names = current_user.tag_counts_on(:tags).order('count DESC')
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
    params.require(:user).permit(
      tags_attributes: [:id, :name, :_destroy]
    )
  end
end
