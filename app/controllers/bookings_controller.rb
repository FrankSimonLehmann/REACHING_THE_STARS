class BookingsController < ApplicationController
  def new
    @star = Star.find(params[:star_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  # def edit
  #   @booking = Booking.find(params[:id])
  # end

  # def update
  #   @booking = Booking.find(params[:id])
  #   @booking.update(booking_params)
  #   redirect_to stars_path(@stars)
  # end

  def create
    @booking = Booking.new(booking_params)
    @star = Star.find(params[:star_id])
    @booking.user = current_user
    @booking.star = @star
    raise
    booked
    if @booking.save
      redirect_to mybookings_path
    else
      render :new
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update!(booking_status: true)
    if @booking.booking_status
      redirect_to mybookings_path, notice: "Booking accepted"
    else
      redirect_to @booking, notice: "Booking could not be accepted, please try again"
    end
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update!(booking_status: false)
    if @booking.booking_status
      redirect_to @booking, notice: "Booking rejected"
    else
      redirect_to mybookings_path, notice: "Booking could not be rejected, please try again"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to mybookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_status, :comment, :start_date, :end_date)
  end

  def booked
    booked_dates = []
    @star = Star.find(params[:star_id])
    @bookings = Booking.where(booking_status: true, star: @star)
    @bookings.each do |booking|
      starting_date = booking.start_date
      ending_date = booking.end_date
      while ending_date >= starting_date
        booked_dates << starting_date.to_s
        starting_date += 1.days
        # start_date = start_date.next_day
      end
    end
    return booked_dates
  end
end
