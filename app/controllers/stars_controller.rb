class StarsController < ApplicationController

  def show

  end

  def new
    @star = Star.new
  end

  def create
    @star = Star.new(star_params)
    if @star.save
      redirect_to @star
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @star = Star.find(params[:id])
    @star.destroy
    redirect_to stars_path, status: see_others
  end

  private
  def star_params
    params.require(:star).permit(:name, :description, :registration_number, :price, :availability, :location)
  end

end
