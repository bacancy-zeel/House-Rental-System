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
    
  end

  def search 
    @houses = Address.where(city: params[:city])
    
    render :home, :object => @houses
    
  end

  def approval
    @approval = House.joins(:address,:user).select('houses.*,addresses.*,users.*').where("houses.approved=?",false)

  end

  

  def update
    if @house.approved == false
      @house.update(approved: true)
      @approval = House.joins(:address,:user).select('houses.*,addresses.*,users.*').where("houses.approved=?",false)
      redirect_to approval_path, :object => @approval
    else
      @house.update(approved: false)
      @approval = House.joins(:address,:user).select('houses.*,addresses.*,users.*').where("houses.approved=?",true)
      redirect_to root_path, :object => @approval
    end
    
    
  end
  
  private

  def set_house
      @house = House.find(params[:id])
  end
end
