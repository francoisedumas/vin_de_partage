# frozen_string_literal: true

module TagComponent
  class TagComponent < ViewComponent::Base
    def initialize(name:, icon: nil, color: "red")
      super
      @name = name
      @icon = icon
      @color = color == "white" ? "gray" : color
    end
  end
end
