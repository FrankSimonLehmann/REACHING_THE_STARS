class Star < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presense: true
  validates :description, presense: true
  validates :description, length: { minimum: 5 }
  validates :registration_number, presense: true
  validates :price, presense: true
  validates :availability, presense: true
  validates :location, presense: true
end
