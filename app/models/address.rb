# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :house

  validates :house_address, :state, :city, :area, :pincode, presence: true
  validates :pincode, length: { is: 6 }, numericality: { only_integer: true },
                      if: :pincode_present?

  delegate :present?, to: :pincode, prefix: true
end
