class HousesController < ApplicationController


    def index
        @house = House.where(user_id: current_user.id)
        
    end

    def show
    end

    def new
        @house = House.new
    end

    def edit
    end

    def create
      @house = House.new(house_params)
      @house.user = current_user
      respond_to do |format|

          if @house.save

             format.html { redirect_to address_new_path(@house)}

          else
              
              format.html { render :new }
          end

      end
    end

    def update
    end

    def destroy
    end



    private

    def set_house
        
    end
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:category, :house_type, :square_feet, :amount, :reserved, :approved, :user_id)
    end


end