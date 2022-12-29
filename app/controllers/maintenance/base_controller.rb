# frozen_string_literal: true

module Maintenance
  class BaseController < ApplicationController
    before_action :enforce_policy

    def index
    end

    private

    def enforce_policy
      return head :forbidden unless MaintenancePolicy.role_can_access?
    end

    def active_menu_link
      maintenance_path
    end
  end
end
