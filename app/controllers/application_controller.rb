# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SetCurrentRequestDetails
  before_action :authenticate_user!

  private

  def active_menu_link
    root_path
  end
  helper_method :active_menu_link
end
