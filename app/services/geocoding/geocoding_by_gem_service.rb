# frozen_string_literal: true

module Geocoding
  class GeocodingByGemService < BaseService
    attr_reader :producer

    def initialize(options = {})
      super
      @producer = Producer.find(options[:id])
    end

    def call
      producer.geocode
    end
  end
end
