# frozen_string_literal: true

class Producer < ApplicationRecord
  extend Enumerize

  belongs_to :user
  has_many :producer_labels, dependent: :destroy
  has_many :labels, through: :producer_labels

  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  PHOTO = {
    alsace_lorraine: "region/alsace.jpg",
    beaujolais: "region/beaujolais.jpg",
    bordeaux: "region/bordeaux.jpg",
    bourgogne: "region/bourgogne.jpg",
    champagne: "region/champagne.jpg",
    corse: "region/corse.jpg",
    jura_bugey_savoie: "region/jura.jpg",
    languedoc_roussillon: "region/languedoc.jpg",
    loire: "region/loire.jpg",
    provence: "region/provence.jpg",
    rhone: "region/rhone.jpg",
    sud_ouest: "region/sud.jpg",
    default: "default_wine.avif"
  }.freeze

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

  enumerize :region, in: REGIONS, predicates: true

  after_create do
    cover = PHOTO[region.to_sym] || PHOTO[:default]
    update(cover:)
  end
end
