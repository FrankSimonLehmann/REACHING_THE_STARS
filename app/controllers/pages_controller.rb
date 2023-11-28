class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @stars = Star.all
  end
end
