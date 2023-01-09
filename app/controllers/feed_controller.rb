# frozen_string_literal: true

class FeedController < ApplicationController
  def show
    @bottles = Bottle.last(5)
    @producers = Producer.last(5)
  end
end
