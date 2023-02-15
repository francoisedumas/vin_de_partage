# frozen_string_literal: true

module Filters
  class BottlesFilterService < BaseService
    attr_reader :params

    def initialize(options = {}) # rubocop:disable Lint/MissingSuper
      @params = options[:params]
      @user_id = options[:user_id]
    end

    def call
      bottles = Bottle.all
      bottles = bottles.search_general_information(@params[:query]) if @params[:query].present?
      bottles = bottles.by_color(@params[:color]) if @params[:color].present?
      bottles.where(user_id: @user_id) if @params[:my_wine].present?
      bottles
    end
  end
end
