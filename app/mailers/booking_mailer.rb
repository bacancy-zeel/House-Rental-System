# frozen_string_literal: true

class BookingMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booking_confirmation.subject
  #
  def booking_confirmation(user, house)
    @user = user
    @house = house
    mail to: @user.email, subject: 'House Reservation Confirmation'
  end

  def house_approval(house)
    @house = house
    mail to: @house.house.user.email, subject: 'House Approval Confirmation'
  end

  def house_disapproval(house)
    @house = house
    mail to: @house.house.user.email, subject: 'House Rejection Confirmation'
  end

  def house_post(house)
    @house = house
    mail to: 'zeelbhavsar06@gmail.com', subject: 'New House Added'
  end
end
