class CitiesController < ApplicationController
    def index
        @houses = Address.where(city: params[:city])
        
      end
end