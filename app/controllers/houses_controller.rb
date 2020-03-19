# frozen_string_literal: true

class HousesController < ApplicationController
  before_action :set_house, only: %i[edit update destroy]
  before_action :authenticate_user!

  def index
    @reserved = current_user.houses.where('houses.reserved=?', true)
    @not_reserved = House.where(user_id: current_user.id, reserved: false)
  end

  def show
    @house = Address.eager_load(:house)
                    .where('addresses.house_id=?', params[:id]).first
 
  end

  def new
    @house = House.new
  end

  def edit; end

  def create
    @house = House.new(house_params)
    @house.user = current_user
    respond_to do |format|
      if @house.save
        format.html { redirect_to new_house_address_path(@house) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    if @house.update(house_params)
      redirect_to edit_house_address_path(@house),
                  method: :post,
                  notice: 'House Profile was successfully updated.'
    else
      render :edit
    end
  end

  def approval_update
    @house = Address.eager_load(house: :user)
                    .find_by('addresses.house_id=?', params[:house_id])
    if @house.house.approved == false
      @house.house.update(approved: true)
      BookingMailer.house_approval(@house).deliver
      redirect_to not_approved_path
    else
      @house.house.update(approved: false)
      BookingMailer.house_disapproval(@house).deliver
      redirect_to root_path
    end
  end

  def reserve_update
    @house = Address.eager_load(house: :user)
                    .find_by('addresses.house_id=?', params[:house_id])
    @house.house.update(reserved: true)
    current_user.add_role :customer
    flash[:success] = 'You will Receive Confirmation mail'
    BookingMailer.booking_confirmation(current_user, @house).deliver
    redirect_to root_path
  end

  def destroy
    @house.destroy
    redirect_to houses_url, notice: 'House was successfully destroyed.' 
  end

  private

  def set_house
    @house = House.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def house_params
    params.require(:house).permit(:category, :house_type, :square_feet, :amount,
                                  :reserved, :approved, images: [])
  end
end
