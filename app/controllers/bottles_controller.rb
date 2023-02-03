# frozen_string_literal: true

class BottlesController < ApplicationController
  before_action :set_bottle, only: %i[show edit update]

  def index
    @breadcrumb_items = {
      "bottles.show.feed": feed_path
    }
    if params[:search]
      @bottles = Bottle.where(user_id: Current.user)
      @filter = true
    else
      @bottles = Bottle.all
      @filter = false
    end
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
      :domaine_name, :producer_name, :appelation,
      :color, :year,
      :photo
    )
  end
end
