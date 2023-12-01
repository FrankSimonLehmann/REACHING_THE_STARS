class Star < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_synopsis,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 5 }
  validates :registration_number, presence: true
  validates :price, presence: true
  validates :availability, presence: true, allow_blank: true
  validates :location, presence: true
end
