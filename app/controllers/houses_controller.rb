# frozen_string_literal: true

class HousesController < ApplicationController
  before_action :set_house, only: %i[edit update destroy]
  before_action :authenticate_user!

  def index
    current_user.houses
    @house = House.where(user_id: current_user.id)
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
        format.html { redirect_to new_address_path(@house) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    if @house.update(house_params)
      redirect_to edit_address_path(@house),
                  method: :post,
                  notice: 'House Profile was successfully updated.'
    else
      render :edit
    end
  end

  def approval_update
    @house = House.find(params[:house_id])
    @user = @house.user
    if @house.approved == false
      @house.update(approved: true)
      BookingMailer.house_approval(current_user, @user).deliver
      redirect_to not_approved_path
    else
      @house.update(approved: false)
      BookingMailer.house_disapproval(current_user, @user).deliver
      redirect_to root_path
    end
  end

  def reserve_update
    @house = House.find(params[:house_id])
    @user = User.find_by(id: @house.user_id)
    @house.update(reserved: true)
    current_user.add_role :customer
    flash[:success] = 'You will Receive Confirmation mail'
    BookingMailer.booking_confirmation(current_user, @user).deliver
    redirect_to root_path
  end

  def destroy
    @house.destroy
    redirect_to houses_url, notice: 'House was successfully destroyed.' 
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def house_params
    params.require(:house).permit(:category, :house_type, :square_feet, :amount,
                                  :reserved, :approved, images: [])
  end
end
