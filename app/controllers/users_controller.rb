class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update(user_params)
    respond_with current_user, location: edit_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
