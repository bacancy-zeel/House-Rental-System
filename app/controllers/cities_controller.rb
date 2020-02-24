class CitiesController < ApplicationController
    def index
        @houses = House.joins(:address,:user).select('houses.*,addresses.*,users.*')
       
      
      end
end