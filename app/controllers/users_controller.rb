# frozen_string_literal: true

class UsersController < ApplicationController
  def home
    @houses = Address.eager_load(house: :user)
                     .where('houses.approved=? AND houses.reserved=?',
                            true, false)
  end

  def index
    @cities = CS.cities(params[:state])
    @houses = Address.where(city: params[:city])
    @address_cities = CS.cities(params[:address_state])
  end

  def show_house
    @house = Address.eager_load(house: :user)
                    .find_by('houses.id=?', params[:id])
  end

  def search
    @houses = Address.where(city: params[:city])

    render :home, object: @houses
  end

  def not_approved
    @approval = Address.eager_load(house: :user)
                       .where('houses.approved=?', false)
  end
end
