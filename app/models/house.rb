class House < ApplicationRecord
    has_many :comments
    has_many :reservations
end
