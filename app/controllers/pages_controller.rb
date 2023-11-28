class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @stars = Star.all
  end

  def booking
    @bookings = Booking.all.select { |i| i.user_id == current_user.id }
  end

  def ownedstars
    @stars = Star.all.select { |i| i.user_id == current_user.id }
  end
end
