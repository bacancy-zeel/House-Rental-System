class House < ApplicationRecord
    
    has_many :comments
    has_many :reservations
    has_one :address, dependent: :destroy
    belongs_to :user
    has_many_attached :images

    Categories = ['1-BHK','2-BHK','3-BHK','4-BHK']
end
