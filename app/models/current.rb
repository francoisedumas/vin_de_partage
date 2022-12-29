# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  attribute :user

  def role
    user&.role.to_sym
  end
end

