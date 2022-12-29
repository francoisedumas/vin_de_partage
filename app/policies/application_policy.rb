# frozen_string_literal: true

class ApplicationPolicy
  def self.user
    Current.user
  end

  def self.role
    Current.role
  end
end
