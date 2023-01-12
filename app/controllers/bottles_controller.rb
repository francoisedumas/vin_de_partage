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

  def new
    @breadcrumb_items = {
      "bottles.show.feed": feed_path
    }
    @bottle = Bottle.new
  end

  def create
    @bottle = current_user.bottles.build(bottle_params)

    respond_to do |format|
      if @bottle.save
        format.html { redirect_to bottle_path(@bottle) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_bottle
    @bottle = Bottle.find(params[:id])
  end

  def bottle_params
    params.require(:bottle).permit(
      :name, :country, :region,
      :domaine_name, :producer, :appelation,
      :color, :year,
      :photo
    )
  end
end
