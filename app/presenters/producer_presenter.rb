# frozen_string_literal: true

class ProducerPresenter < ApplicationPresenter
  def created_at
    I18n.l(__getobj__.created_at, format: :short)
  end

  def edit_link
    link_to I18n.t("edit"),
            Rails.application.routes.url_helpers.edit_maintenance_producer_path(__getobj__),
            class: "text-primary-600 font-semibold hover:text-primary-800"
  end

  def destroy_link
    link_to I18n.t("destroy"),
            Rails.application.routes.url_helpers.maintenance_producer_path(__getobj__),
            data: { turbo_method: :delete },
            class: "text-primary-600 font-semibold hover:text-primary-800"
  end
end
