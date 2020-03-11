# frozen_string_literal: true

class HousesController < ApplicationController
  before_action :set_house, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @house = House.where(user_id: current_user.id)
  end

  def show
    @houses = House.joins(:address).select('houses.*,addresses.*').find_by('houses.id=?', params[:id])
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
    respond_to do |format|
      if @house.update(house_params)

        format.html { redirect_to edit_address_path(@house), method: :post, notice: 'House Profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def approval_update
    @house = House.find(params[:house_id])
    @user = User.find_by(id: @house.user_id)
    if @house.approved == false
      @house.update(approved: true)
      BookingMailer.house_approval(current_user.first_name, current_user.last_name, @user.first_name, @user.last_name, @user.email).deliver
      @approval = House.joins(:address, :user).select('houses.*,addresses.*,users.*').where('houses.approved=?', false)
      redirect_to not_approved_path, object: @approval
    else
      @house.update(approved: false)
      BookingMailer.house_disapproval(current_user.first_name, current_user.last_name, @user.first_name, @user.last_name, @user.email).deliver
      @approval = House.joins(:address, :user).select('houses.*,addresses.*,users.*').where('houses.approved=?', true)
      redirect_to root_path, object: @approval
    end
  end

  def reserve_update
    @house = House.find(params[:house_id])
    @user = User.find_by(id: @house.user_id)
    @house.update(reserved: true)
    current_user.add_role :customer
    flash[:success] = 'You will Receive Confirmation mail'
    BookingMailer.booking_confirmation(current_user.first_name, current_user.last_name, @user.first_name, @user.last_name, current_user.email).deliver
    redirect_to root_path
  end

  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def house_params
    params.require(:house).permit(:category, :house_type, :square_feet, :amount, :reserved, :approved, :user_id, images: [])
  end
end
