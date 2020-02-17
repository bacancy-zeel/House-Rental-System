class CitiesController < ApplicationController
    def index
        @cities = CS.cities(params[:state])
    end
end