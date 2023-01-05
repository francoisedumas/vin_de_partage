# frozen_string_literal: true

class Bottle < ApplicationRecord
  extend Enumerize

  belongs_to :user

  # COUNTRIES = %i[
  #   Italie
  #   France
  #   Espagne
  #   USA
  #   Argentine
  #   Australie
  #   Chili
  #   Afrique du Sud
  #   Chine
  #   Allemagne
  #   Portugal
  #   Russie
  #   Roumanie
  #   Hongrie
  #   Nouvelle-Zélande
  #   Brésil
  #   Autriche
  #   Grèce
  #   Géorgie
  #   Suisse
  # ].freeze
  COUNTRIES = %i[
    France
  ].freeze

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

  COLORS = %i[pink red yellow white].freeze

  enumerize :region, in: REGIONS, predicates: true
  enumerize :color, in: COLORS, predicates: true
  enumerize :country, in: COUNTRIES, predicates: true

  # Associations
  has_one_attached :photo
end
