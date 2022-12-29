# frozen_string_literal: true

module Maintenance
  class UsersController < BaseController
    def index
      @users = User.all.order(:last_name, :first_name)
      @breadcrumb_items = {
        "maintenance.base.index.title": maintenance_path
      }
    end

    def new
      @breadcrumb_items = {
        "maintenance.base.index.title": maintenance_path,
        "maintenance.users.index.title": maintenance_users_path
      }
      @user = User.new
    end

    def edit
      @breadcrumb_items = {
        "maintenance.base.index.title": maintenance_path,
        "maintenance.users.index.title": maintenance_users_path
      }
      @user = User.find(params[:id])
    end

    def create
      User.invite!(user_params)

      redirect_to maintenance_users_path
    end

    def update
      @user = User.find(params[:id])
      @user.update!(user_params)

      @user.invite! if email_changed?

      redirect_to maintenance_users_path
    end

    private

    def email_changed?
      @user.email_before_last_save && (@user.email != @user.email_before_last_save)
    end

    def user_params
      params.require(:user).permit(:email, :last_name, :first_name, :role)
    end
  end
end
