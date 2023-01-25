# frozen_string_literal: true

module Maintenance
  class ProducersController < BaseController
    def index
      @producers = Producer.all
      @breadcrumb_items = {
        "maintenance.base.index.title": maintenance_path
      }
    end

    def edit
      @breadcrumb_items = {
        "maintenance.base.index.title": maintenance_path,
        "maintenance.producers.index.title": maintenance_producers_path
      }
      @producer = Producer.find(params[:id])
    end

  end
end
