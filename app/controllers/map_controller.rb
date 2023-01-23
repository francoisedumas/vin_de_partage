# frozen_string_literal: true

class MapController < ApplicationController
  def show
    @breadcrumb_items = {
      "map.show.feed": feed_path
    }
    @producers = Producer.all

    @markers = @producers.geocoded.map do |producer|
      {
        id: producer.id,
        lat: producer.latitude,
        lng: producer.longitude
      }
    end
  end
end
