# frozen_string_literal: true

class FeedController < ApplicationController
  def show
    @breadcrumb_items = { "Feed" => feed_path }
    @bottles = Bottle.last(5)
  end
end
