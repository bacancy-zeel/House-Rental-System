# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :house
  belongs_to :user
end
