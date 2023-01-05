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
end
