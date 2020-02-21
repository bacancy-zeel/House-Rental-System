class House < ApplicationRecord
    
    has_many :comments
    has_many :reservations
    has_one :address, dependent: :destroy
    belongs_to :user
    has_many_attached :images

end
