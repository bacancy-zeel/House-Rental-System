class HousesController < ApplicationController

    before_action :set_house, only: [:show, :edit, :update, :destroy]
    before_action :select_city, only: [:index]

    def index
        @houses = House.all
    end

    def show
    end

    def new
        @house = House.new
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:name, :published_date, :author_id)
    end

    def select_city
      # @city = CS.states(:in)
    end

end