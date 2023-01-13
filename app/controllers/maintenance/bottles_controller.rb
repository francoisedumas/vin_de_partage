# frozen_string_literal: true

module Maintenance
  class BottlesController < BaseController
    def index
      @bottles = Bottle.all
      @breadcrumb_items = {
        "maintenance.base.index.title": maintenance_path
      }
    end
  end
end
