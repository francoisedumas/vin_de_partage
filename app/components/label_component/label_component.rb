# frozen_string_literal: true

module LabelComponent
  class LabelComponent < ViewComponent::Base
    def initialize(name:, color: "white", type: nil)
      super
      @bg_color = color == "white" ? "white" : "red-50"
      @text_color = "black"
      @name = name
      @type = type
    end
  end
end
