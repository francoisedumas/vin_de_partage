# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize

  # Associations
  has_one_attached :photo
  has_many :bottles, dependent: :destroy
  has_many :producers, dependent: :destroy

  ROLES = %i[maintainer admin default].freeze

  enumerize :role, in: ROLES, predicates: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    "#{first_name&.capitalize} #{last_name&.upcase}".strip.presence || email.match(/^[^@]+/).to_s.capitalize
  end
end
