class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :star
  has_many :reviews, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true

  def available_date(dates)
    starting_date, ending_date = start_date, end_date
    while ending_date >= starting_date
      if dates.include?(starting_date.to_s)
        self.errors.add(:start_date, :is_already_taken)
        p starting_date.to_s
      end
      starting_date += 1.days
    end
  end
end
