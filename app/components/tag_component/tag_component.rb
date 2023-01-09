# frozen_string_literal: true

module TagComponent
  class TagComponent < ViewComponent::Base
    def initialize(name:, icon:)
      super
      @name = name
      @icon = icon
    end
  end
end
