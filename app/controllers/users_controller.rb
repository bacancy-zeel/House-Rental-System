class UsersController < ApplicationController
  before_action :set_house, only: [:edit, :update]
  def home
    @houses = House.joins(:address,:user).select('houses.*,addresses.*,users.*').where("houses.approved=?",true)
    
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

  def approval
    @approval = House.joins(:address,:user).select('houses.*,addresses.*,users.*').where("houses.approved=?",false)

  end

  

  def update
    @approval.approved = true
    render :approval, :object => @approval
  end
  
  private

  def set_house
      @approval = House.find(params[:id])
  end
end
