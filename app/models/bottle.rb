# frozen_string_literal: true

class Bottle < ApplicationRecord
  include PgSearch::Model
  extend Enumerize
  acts_as_votable

  # Associations
  belongs_to :user
  belongs_to :producer, optional: true

  # to check how to use , if: :producer_id_changed?
  after_save :set_domaine_name

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
  validates :color, presence: true

  # Scopes and search

  scope :by_color, -> (color) { where(color:) }

  pg_search_scope :search_general_information,
                  against: [:name, :domaine_name, :producer_name, :appelation, :region],
                  using: {
                    tsearch: { prefix: true }
                  }

  def bookmark!(user)
    if user.voted_up_on? self, vote_scope: "bookmark"
      unvote_by user, vote_scope: "bookmark"
    else
      upvote_by user, vote_scope: "bookmark"
    end
  end

  private

  def set_domaine_name
    return if producer_id.nil? || domaine_name.present?

    update(domaine_name: producer.domaine_name)
  end
end
