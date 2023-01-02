# frozen_string_literal: true

class BottlesController < ApplicationController
  before_action :set_bottle, only: %i[show]

  def index
    @breadcrumb_items = {
      "bottles.show.feed": feed_path
    }
    @bottles = Bottle.all
  end

  def show
    @breadcrumb_items = {
      "bottles.show.feed": feed_path,
      "bottles.show.wines": bottles_path
    }
  end

  private

  def set_bottle
    @bottle = Bottle.find(params[:id])
  end
end
