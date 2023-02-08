# frozen_string_literal: true

class PasswordsController < Devise::PasswordsController
  skip_before_action :require_no_authentication, only: :update

  def update
    user = current_user
    if user.update_with_password(password_params)
      sign_in user, bypass: true
      flash[:notice] = t("devise.passwords.updated_not_active")
    else
      flash[:alert] = t("devise.passwords.update_not_working")
    end
    redirect_to edit_profile_path
  end

  private

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
