# frozen_string_literal: true

class Bottle < ApplicationRecord
  extend Enumerize

  # Associations
  belongs_to :user
  belongs_to :producer, optional: true

  # to check how to use , if: :producer_id_changed?
  after_save :set_producer_name

  COUNTRIES = %i[
    france
  ].freeze

  REGIONS = %i[
    alsace_lorraine
    beaujolais
    bordeaux
    bourgogne
    champagne
    corse
    jura_bugey_savoie
    languedoc_roussillon
    loire
    provence
    rhone
    sud_ouest
  ].freeze

  COLORS = %i[pink red yellow white].freeze

  enumerize :region, in: REGIONS, predicates: true
  enumerize :color, in: COLORS, predicates: true
  enumerize :country, in: COUNTRIES, predicates: true

  # Associations
  has_one_attached :photo

  # Validations
  validates :region, presence: true
  validates :domaine_name, presence: true

  private

  def set_producer_name
    return if producer_id.nil? || producer_name.present?

    self.producer_name = producer.domaine_name
  end
end
