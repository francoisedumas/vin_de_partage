# frozen_string_literal: true

class Bottle < ApplicationRecord
  extend Enumerize

  belongs_to :user

  REGIONS = %i[
    Alsace-Lorraine
    Beaujolais
    Bordeaux
    Bourgogne
    Champagne
    Corse
    Jura-Bugey-Savoie
    Languedoc-Roussillon
    Loire
    Provence
    Rhône
    Sud-Ouest
  ].freeze

  COLORS = %i[Rouge Blanc Rosé].freeze

  enumerize :region, in: REGIONS, predicates: true
  enumerize :color, in: COLORS, predicates: true

  # Associations
  has_one_attached :photo
end
