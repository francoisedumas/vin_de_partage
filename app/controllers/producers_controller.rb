# frozen_string_literal: true

class ProducersController < ApplicationController
  before_action :set_producer, only: %i[show]

  def index
    @breadcrumb_items = {
      "producers.index.feed": feed_path
    }
    @producers = Producer.all

    @markers = @producers.geocoded.map do |producer|
      {
        id: producer.id,
        lat: producer.latitude,
        lng: producer.longitude
      }
    end
  end

  def show
    @breadcrumb_items = {
      "producers.show.feed": feed_path,
      "producers.show.wines": producers_path
    }
  end

  def new
    @breadcrumb_items = {
      "producers.show.feed": feed_path
    }
    @producer = Producer.new
    @labels = Label.all
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
