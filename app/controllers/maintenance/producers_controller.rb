# frozen_string_literal: true

module Maintenance
  class ProducersController < BaseController
    before_action :set_producer, only: %i[edit update destroy]

    def index
      @producers = Producer.all
      @breadcrumb_items = {
        "maintenance.base.index.title": maintenance_path
      }
    end

    def edit
      @breadcrumb_items = {
        "maintenance.base.index.title": maintenance_path,
        "maintenance.producers.index.title": maintenance_producers_path
      }
      @producer = Producer.find(params[:id])
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

    def destroy
      if @producer.bottles.empty?
        @producer.destroy
        redirect_to maintenance_producers_path
      else
        @producers = Producer.all
        flash[:notice] = t(".error")
        render :index
      end
    end

    private

    def set_producer
      @producer = Producer.includes(:labels).find(params[:id])
    end

    def producer_params
      params.require(:producer).permit(
        :latitude, :longitude,
        :address, :region,
        :domaine_name, :name,
        :website,
        { producer_labels_attributes: [:label_id] }
      )
    end
  end
end
