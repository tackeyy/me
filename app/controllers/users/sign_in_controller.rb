class Users::SignInController < ApplicationController
  skip_before_action :require_login

  def show
    @user = User.new
  end

  def create
    email, password = params[:user].values_at(:email, :password)
    @user = login(email, password)

    if @user.blank?
      @user = User.new(email: email).tap do  |user|
        user.errors.add(:email, :not_found_or_invalid_password)
      end
      return render :show
    end

    redirect_to users_path
  end
end
