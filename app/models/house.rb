# frozen_string_literal: true

class House < ApplicationRecord
  has_many :comments
  has_many :reservations
  has_one :address, dependent: :destroy
  belongs_to :user
  has_many_attached :images
  House_types = ['Apartments', 'Villa/House', 'Flats', 'Row House',
                 'Farm House'].freeze
  Categories = %w[1-BHK 2-BHK 3-BHK 4-BHK].freeze
  Reserve = %w[false true].freeze

  validates :amount, presence: true, numericality: { only_integer: true }
  validates :square_feet, presence: true
end
