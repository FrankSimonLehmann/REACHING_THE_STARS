class StarsController < ApplicationController

  def index
    @stars = Star.all
  end

  def show
    @star = Star.find(params[:id])
    @booking = Booking.new
    @markers = [{
      lat: @star.user.latitude,
      lng: @star.user.longitude
    }]
  end

  def new
    @star = Star.new
  end

  def create
    @star = Star.new(star_params)
    if @star.save
      redirect_to ownedstars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @star = Star.find(params[:id])
  end

  def update
    @star = Star.find(params[:id])
    if @star.update(star_params)
      redirect_to star_path(@star)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @star = Star.find(params[:id])
    @star.destroy
    redirect_to ownedstar_path, status: :see_others
  end

  private
  def star_params
    params.require(:star).permit(:name, :description, :registration_number, :price, :availability, :location, :user_id, :photo)
  end
end
