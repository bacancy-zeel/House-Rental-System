# frozen_string_literal: true

class CitiesController < ApplicationController
  def index
    @houses = House.joins(:address, :user).select('houses.*,addresses.*,users.*').where('houses.approved=? AND addresses.city=?', true, params[:city])
    end
end
