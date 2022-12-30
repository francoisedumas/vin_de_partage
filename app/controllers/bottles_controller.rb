# frozen_string_literal: true

class BottlesController < ApplicationController
  # before_action :set_bottle, only: %i[show]

  def index
    @breadcrumb_items = { "Root" => root_path, "Feed" => feed_path }
    @bottles = Bottle.all
  end

  def show
    @breadcrumb_items = { "Root" => root_path, "Feed" => feed_path, "Vins" => bottles_path }
    @bottle = Bottle.find(params[:id])
  end

  private

  def set_bottle
  end
end
