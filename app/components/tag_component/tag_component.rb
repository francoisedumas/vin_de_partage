# frozen_string_literal: true

module TagComponent
  class TagComponent < ViewComponent::Base
    def initialize(name:)
      super
      @name = name
    end

    def picto
      Producer.co_benefit_icon(@name)
    end
  end
end
