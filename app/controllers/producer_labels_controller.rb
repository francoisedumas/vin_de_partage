# frozen_string_literal: true

class ProducerLabelsController < ApplicationController
  before_action :set_producer_label, only: [:destroy]

  def destroy
    @producer_label.destroy
    respond_to do |format|
      format.html { redirect_to producers_url, notice: 'Label was successfully destroyed.' }
      format.json { render json: { success: true } }
    end
  end

  private

  def set_producer_label
    @producer_label = ProducerLabel.find(params[:id])
  end
end
