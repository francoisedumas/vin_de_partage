# frozen_string_literal: true

class DataPresenterComponent < ViewComponent::Base
  renders_many :entries, "EntryComponent"

  def initialize(title)
    super
    @title = title
  end

  class EntryComponent < ViewComponent::Base
    attr_reader :label, :pill, :color

    def initialize(label, pill: false, color: "red")
      super
      @label = label
      @pill = pill
      @color = color
    end

    def value
      content.presence || "Absent"
    end

    def tag_color
      @color == "white" ? "gray" : @color
    end

    def call
      content
    end
  end
end
