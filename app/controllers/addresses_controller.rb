# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :set_address, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index
    @addresses = Address.all
  end

  def show; end

  def new
    @address = Address.new
  end

  def edit
    @house = House.find_by(id: params[:house_id])
  end

  def create
    @address = Address.new(address_params)
    @address.house_id = params[:house_id].to_i
    @house = House.find_by(id: params[:house_id])
    @user = @house.user
    current_user.add_role :landlord unless current_user.has_role? :landlord
    respond_to do |format|
      if @address.save
        flash[:success] = 'Request is sent to Admin'
        BookingMailer.house_post(@user).deliver
        format.html { redirect_to houses_path }

      else

        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)

        format.html do
          redirect_to houses_url,
                      notice: 'House Profile was successfully updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy; end

  private

  def set_address
    @address = Address.find_by(house_id: params[:house_id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def address_params
    params.require(:address).permit(:house_address, :state, :city, :area,
                                    :pincode)
  end
end
