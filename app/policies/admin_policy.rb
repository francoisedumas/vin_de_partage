# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  class << self
    def role_can_access?
      role.in? %i[maintainer admin]
    end
  end
end
