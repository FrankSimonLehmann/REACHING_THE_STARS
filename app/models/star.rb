class Star < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 5 }
  validates :registration_number, presence: true
  validates :price, presence: true
  validates :availability, presence: true
  validates :location, presence: true
end
