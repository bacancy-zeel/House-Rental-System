# frozen_string_literal: true

class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :houses
  has_many :comments
  has_many :reservations

  validates :first_name, :last_name, :contact, :birth_date, :gender,
            presence: true
end
