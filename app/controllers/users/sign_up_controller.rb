class Users::SignUpController < ApplicationController
  skip_before_action :require_login

  def show
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    return render :show if @user.errors.present?

    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation
    )
  end
end
