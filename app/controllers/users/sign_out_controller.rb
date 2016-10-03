class Users::SignOutController < ApplicationController
  def destroy
    logout
    redirect_to users_sign_in_url
  end
end
