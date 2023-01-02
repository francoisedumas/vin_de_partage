# frozen_string_literal: true

class MaintenancePolicy < ApplicationPolicy
  class << self
    def role_can_access?
      role.in? %i[maintainer admin]
    end
  end
end
