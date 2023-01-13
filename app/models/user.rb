# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_one_attached :photo
  has_many :bottles, dependent: :destroy
  has_many :producers, dependent: :destroy

  # Validation
  validates :role, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  ROLES = %i[maintainer admin default].freeze

  enumerize :role, in: ROLES, predicates: true

  def full_name
    "#{first_name&.strip.capitalize} #{last_name&.strip.upcase}".strip.presence || email.match(/^[^@]+/).to_s.capitalize
  end
end
