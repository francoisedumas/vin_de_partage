# frozen_string_literal: true

module ProducerShowComponent
  class ProducerShowComponent < ViewComponent::Base
    include ImageHelper

    def initialize(producer:, only_static_position: false)
      super
      @producer = producer
      @labels = producer.labels || []
      @only_static_position = only_static_position
    end

    def producer_image
      @producer.cover.presence || "default_wine.avif"
    end
  end
end
