class PagesController < ApplicationController
  def home
    @stars = Star.all
    if params[:query].present?
      @stars = Star.search_by_title_and_synopsis(params(:query))
    end
  end

  def booking
    @bookings = current_user.bookings
    @pendingbook = current_user.received_bookings.select { |b| b.booking_status == false}
  end

  def ownedstars
    @stars = Star.all.select { |i| i.user_id == current_user.id }
  end

  def profile
    @profile = User.find(current_user.id)
  end
end
