# frozen_string_literal: true

class Producer < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

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

  CO_BENEFIT_ICONS = {
    acces_a_l_eau: "water",
    acces_a_l_education: "education",
    acces_a_une_energie_propre: "sun",
    adaptation_changements_climatique: "thunder",
    biodiversite: "biodiversity",
    circuits_courts: "leaves",
    consomation_et_production_responsables: "soil_leaves",
    default: "leaves",
    depollution_des_eaux: "water",
    depollution_des_sols: "leaves",
    developpement_social: "person",
    education_de_qualite: "education",
    emploi_local: "job",
    egalite_hommes_femmes: "equality",
    lutte_contre_la_pauvrete: "person",
    protection_des_sols: "leaves",
    protection_des_cours_d_eau: "water",
    protection_animale: "animal",
    qualite_de_l_air: "air",
    qualite_de_vie: "person",
    qualite_de_l_eaux: "water",
    reduction_de_la_faim: "famine_reduction",
    sante_humaine: "person",
    securite_alimentaire: "food_access_security",
    reduction_de_la_consommation_d_energie: "power",
    preservation_d_ecosysteme_naturel: "biodiversity",
    qualite_de_la_terre: "leaves",
    territoire_durable: "land",
  }.freeze

  after_create do
    cover = PHOTO[region.to_sym] || PHOTO[:default]
    update(cover:)
  end

  def self.co_benefit_icon(name)
    CO_BENEFIT_ICONS[name.parameterize(separator: "_").to_sym] || :default
  end
end
