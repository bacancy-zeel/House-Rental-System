class UsersController < ApplicationController
  def home
    @houses = Address.where(city: :Ahmedabad)
  end

  def index
    @cities = CS.cities(params[:state])
    @houses = Address.where(city: params[:city])
    
  end
end
