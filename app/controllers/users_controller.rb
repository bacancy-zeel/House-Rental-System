class UsersController < ApplicationController
  def home
    @houses = House.where(approved: :true)
  end

  def index
    @cities = CS.cities(params[:state])
    @houses = Address.where(city: params[:city])
    @address_cities = CS.cities(params[:address_state])
  end

  def show
    @house = House.find(params[:id])
    
    @address = Address.find_by(house_id: @house)
    
  end
end
