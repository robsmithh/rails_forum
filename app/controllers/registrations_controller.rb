class RegistrationsController < Devise::RegistrationsController

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = "Signed up successfully"
    root_path
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
  end

  def after_update_path_for(resource)
      flash[:notice] = "Account succesfully updated"
      user_path(resource)
  end
end
