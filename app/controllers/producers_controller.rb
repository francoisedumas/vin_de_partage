# frozen_string_literal: true

class ProducersController < ApplicationController
  before_action :set_producer, only: %i[show edit update]

  def index
    @breadcrumb_items = {
      "producers.index.feed": feed_path
    }

    if params[:search]
      @producers = Producer.where(user_id: Current.user)
      @filter = true
    else
      @producers = Producer.all
      @filter = false
    end
  end

  def show
    @breadcrumb_items = {
      "producers.show.feed": feed_path,
      "producers.show.producers": producers_path
    }
  end

  def new
    @breadcrumb_items = {
      "producers.show.feed": feed_path
    }
    @producer = Producer.new
  end

  def edit
    @breadcrumb_items = {
      "producers.edit.feed": feed_path,
      "producers.edit.producers": producers_path
    }
  end

  def create
    @producer = current_user.producers.build(producer_params)

    respond_to do |format|
      if @producer.save
        format.html { redirect_to producer_path(@producer) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @producer.update(producer_params)
    respond_to do |format|
      if @producer.save
        format.html { redirect_to producer_path(@producer) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_producer
    @producer = Producer.includes(:labels).find(params[:id])
  end

  def producer_params
    params.require(:producer).permit(
      :address,
      :domaine_name,
      :name,
      :region,
      :website,
      :latitude,
      :longitude,
      { producer_labels_attributes: [:label_id] }
    )
  end
end
