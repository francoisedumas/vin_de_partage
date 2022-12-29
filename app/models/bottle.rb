class Bottle < ApplicationRecord
  belongs_to :user

  # Associations
  has_one_attached :photo
end
