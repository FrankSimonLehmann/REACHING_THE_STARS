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
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update!(booking_status:true)
    if @booking.booking_status
      redirect_to @booking, notice: "Booking accepted"
    else
      redirect_to @booking, notice: "Booking could not be accepted, please try again"
    end
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update!(booking_status:false)
    if @booking.booking_status
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
