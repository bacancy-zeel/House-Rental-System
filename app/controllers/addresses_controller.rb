class AddressesController < ApplicationController
    def index
        @addresses = Address.all
        
    end

    def show
    end

    def new
        @address = Address.new
    end

    def edit
    end

    def create
      @address = Address.new(address_params)
      @address.house_id = @house.id
      byebug
      respond_to do |format|
          
          if @address.save
             format.html { redirect_to houses_path, notice: 'Request is sent to Admin' }

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:address, :state, :city, :area, :pincode)
    end
end