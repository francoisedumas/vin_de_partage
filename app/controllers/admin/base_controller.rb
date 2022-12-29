# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    before_action :enforce_policy

    def index
    end

    private

    def enforce_policy
      return head :forbidden unless AdminPolicy.role_can_access?
    end

    def active_menu_link
      admin_path
    end
  end
end
