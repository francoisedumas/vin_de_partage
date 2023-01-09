# frozen_string_literal: true

module FeedCardComponent
  class FeedCardComponent < ViewComponent::Base
    def initialize(instance:, path:)
      super
      @instance = instance
      @path = path
    end

    def name
      @instance.domaine_name? ? @instance.domaine_name : @instance.name
    end
  end
end
