class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.all
  end

  # def edit
  #   @booking = Booking.find(params[:id])
  # end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to stars_path(@stars)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    if @booking.save
      redirect_to stars_path(@user)
    else
      render :new
    end
  end

  def accept
    if @booking.accepted!
      redirect_to @booking, notice: "Booking accepted"
    else
      redirect_to @booking, notice: "Booking could not be accepted, please try again"
    end
  end

  def destroy
    @booking.destroy
    redirect_to stars_path(@booking.user), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_status, :comment, :start_date, :end_date)
  end
end
