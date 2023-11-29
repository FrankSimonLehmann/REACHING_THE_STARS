class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :star
  has_many :reviews, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :available_date

  private

  def available_date
    booked_dates = []
    @bookings = Booking.where(booking_status: true, star: self.star)
    @bookings.each do |booking|
      starting_date = booking.start_date
      ending_date = booking.end_date
      while ending_date >= starting_date
        booked_dates << starting_date.to_s
        starting_date += 1.days
      end
    end
    starting_date, ending_date = start_date, end_date
    while ending_date >= starting_date
      if booked_dates.include?(starting_date.to_s)
        self.errors.add(:start_date, :is_already_taken, message: "Some of the dates from your range are already taken")
      end
      starting_date += 1.days
    end
  end
end
