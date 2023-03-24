# frozen_string_literal: true

class BottlesController < ApplicationController
  before_action :set_bottle, only: %i[show edit update bookmark]
  before_action :set_producers, only: %i[new edit]

  def index
    @breadcrumb_items = {
      "bottles.show.feed": feed_path
    }
    @bottles = ::Filters::BottlesFilterService.call(params:, user_id: current_user.id)
  end

  def show
    @breadcrumb_items = {
      "bottles.show.feed": feed_path,
      "bottles.show.wines": bottles_path
    }
  end

  def new
    @breadcrumb_items = {
      "bottles.new.feed": feed_path
    }
    @bottle = Bottle.new
  end

  def edit
    @breadcrumb_items = {
      "bottles.edit.feed": feed_path,
      "bottles.edit.wines": bottles_path
    }
  end

  def create
    @bottle = current_user.bottles.build(bottle_params)

    respond_to do |format|
      if @bottle.save
        format.html { redirect_to bottle_path(@bottle) }
      else
        @producers = Producer.all
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @bottle.update(bottle_params)
    respond_to do |format|
      if @bottle.save
        format.html { redirect_to bottle_path(@bottle) }
      else
        @producers = Producer.all
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def bookmark
    @bottle.bookmark!(current_user)
    respond_to do |format|
      format.html { redirect_to bottle_path(@bottle) }
      format.turbo_stream { render turbo_stream: turbo_stream.replace("bookmark", partial: "bottles/bookmark", locals: { bottle: @bottle }) }
    end
  end

  private

  def set_bottle
    @bottle = Bottle.find(params[:id])
  end

  def set_producers
    @producers = Producer.all
  end

  def bottle_params
    params.require(:bottle).permit(
      :name, :country, :region,
      :domaine_name, :producer_name, :producer_id,
      :appelation, :color, :year,
      :photo
    )
  end
end
