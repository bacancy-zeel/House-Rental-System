# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :house

  validates :house_address, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :area, presence: true
  validates :pincode, presence: true, length: { is: 6 }, numericality: { only_integer: true }

end
