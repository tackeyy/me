class Users::SignOutController < UserController
  def destroy
    logout
    redirect_to users_sign_in_url
  end
end
