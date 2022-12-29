# frozen_string_literal: true

class UserPresenter < ApplicationPresenter
  def created_at
    I18n.l(__getobj__.created_at, format: :short)
  end

  def edit_link
    link_to I18n.t("edit"),
            Rails.application.routes.url_helpers.edit_maintenance_user_path(__getobj__),
            class: "text-primary-600 font-semibold hover:text-primary-800"
  end
end
