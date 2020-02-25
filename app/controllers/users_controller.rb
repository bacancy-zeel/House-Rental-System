class UsersController < ApplicationController
  def home
    @houses = House.joins(:address,:user).select('houses.*,addresses.*,users.*')
  end

  def index
    @cities = CS.cities(params[:state])
    @houses = Address.where(city: params[:city])
    @address_cities = CS.cities(params[:address_state])
    
  end

  def show
    @houses = House.joins(:address,:user).select('houses.*,addresses.*,users.*').find_by("houses.id=?",params[:id])
    @house = House.find(params[:id])
    # @address = Address.find_by(house_id: @house)
    
  end

  def search 
    @houses = Address.where(city: params[:city])
    
    render :home, :object => @houses
    
  end
end
