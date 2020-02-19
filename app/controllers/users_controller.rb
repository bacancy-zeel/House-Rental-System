class UsersController < ApplicationController
  def home
  end

  def index
    @cities = CS.cities(params[:state])
    @houses = House.where(city: params[:city])
  end
end
