# frozen_string_literal: true

class CitiesController < ApplicationController
  def index
    @houses = Address.eager_load(house: :user)
                     .where('houses.approved=? AND addresses.city=?',
                            true, params[:city])
  end
end
