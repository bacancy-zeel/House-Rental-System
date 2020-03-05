class User < ApplicationRecord
  rolify
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :houses
  has_many :comments
  has_many :reservations

  validates :first_name, presence: true, uniqueness: {scope: :email, message: "should have unique mail"}
  validates :last_name, presence: true
  validates :contact, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true
end
