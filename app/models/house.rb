class House < ApplicationRecord
    
    has_many :comments
    has_many :reservations
    belongs_to :user
    has_many_attached :images

end
