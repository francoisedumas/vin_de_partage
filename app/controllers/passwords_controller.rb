# frozen_string_literal: true

class PasswordsController < Devise::PasswordsController
  skip_before_action :require_no_authentication, only: :update

  def update
    user = current_user
    if user.update_with_password(password_params)
      sign_in user, bypass: true
      redirect_to edit_profile_path, notice: t("devise.passwords.updated_not_active")
    else
      redirect_to edit_profile_path, alert: "Password couldn't be updated"
    end
  end

  private

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
