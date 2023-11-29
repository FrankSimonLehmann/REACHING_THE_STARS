class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @stars = Star.all
  end

  def booking
    @bookings = Booking.all.select { |i| i.user_id == current_user.id }
  end

  def ownedstars
    @stars = Star.all.select { |i| i.user_id == current_user.id }
  end

  def profile
    @profile = User.find(current_user.id)
  end

end
