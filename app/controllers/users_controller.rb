class UsersController < UserController
  before_action :require_login

  def edit
  end

  def update
    current_user.update(user_params)
    respond_with current_user, location: users_path
  end

  private

  def user_params
    params.require(:admin).permit(:name, :email)
  end
end
