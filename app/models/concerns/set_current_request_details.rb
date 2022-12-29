# frozen_string_literal: true

module SetCurrentRequestDetails
  extend ActiveSupport::Concern

  included do
    before_action do
      Current.user = current_user
    end

    after_action { Current.reset }
  end
end

