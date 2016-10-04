class Users::TagsController < ApplicationController
  def index
    @tags = current_user.tags
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end
end
