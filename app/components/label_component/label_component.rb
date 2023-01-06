# frozen_string_literal: true

module LabelComponent
  class LabelComponent < ViewComponent::Base
    def initialize(name:, color: "white", type: nil)
      super
      @bg_color = color
      @text_color = color == "white" ? "red" : "white"
      @name = name
      @type = type
    end

    def icon_css
      "pl-2" unless image_url == ""
    end

    def image_url
      case @type
      when "place" then "pictos/pin.svg"
      when "label" then "pictos/label.svg"
      else
        ""
      end
    end
  end
end
