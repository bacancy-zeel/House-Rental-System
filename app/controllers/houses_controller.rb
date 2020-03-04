class HousesController < ApplicationController
    before_action :set_house, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @house = House.where(user_id: current_user.id)
        
    end

    def show
      @houses = House.joins(:address).select('houses.*,addresses.*').find_by("houses.id=?",params[:id])
      
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

             format.html { redirect_to new_address_path(@house)}

          else
              
              format.html { render :new }
          end

      end
    end

    def update
        
            respond_to do |format|
                if @house.update(house_params)

                    format.html { redirect_to houses_url, notice: 'House Profile was successfully updated.' }
                else
                    format.html { render :edit }
                end

            end
        
    end

    def destroy
        @house.destroy
        respond_to do |format|
        format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
        format.json { head :no_content }
    end
    end



    private

    def set_house
        @house = House.find(params[:id])
       
    end
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:category, :house_type, :square_feet, :amount, :reserved, :approved, :user_id, images: [])

    end


end