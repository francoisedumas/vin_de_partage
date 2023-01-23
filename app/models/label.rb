# frozen_string_literal: true

class Label < ApplicationRecord
  has_many :producer_labels, dependent: :destroy
  has_many :producers, through: :producer_labels

  has_one_attached :photo
end
