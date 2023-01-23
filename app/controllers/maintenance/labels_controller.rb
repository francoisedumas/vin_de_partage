# frozen_string_literal: true

module Maintenance
  class LabelsController < BaseController
    def index
      @labels = Label.all.order(:name)
      @breadcrumb_items = {
        "maintenance.base.index.title": maintenance_path
      }
    end

    def new
      @breadcrumb_items = {
        "maintenance.base.index.title": maintenance_path,
        "maintenance.labels.index.title": maintenance_labels_path
      }
      @label = Label.new
    end

    def edit
      @breadcrumb_items = {
        "maintenance.base.index.title": maintenance_path,
        "maintenance.labels.index.title": maintenance_labels_path
      }
      @label = Label.find(params[:id])
    end

    def create
      Label.create(label_params)

      redirect_to maintenance_labels_path
    end

    def update
      @label = Label.find(params[:id])
      @label.update!(label_params)

      redirect_to maintenance_labels_path
    end

    private

    def label_params
      params.require(:label).permit(:name, :photo)
    end
  end
end
