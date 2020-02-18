class HousesController < ApplicationController


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

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:category, :house_type, :square_feet, :amount, :reserved, :approved, :user_id)
    end


end