class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :star
  validates :start_date, presense: true
  validates :end_date, presense: true
end
