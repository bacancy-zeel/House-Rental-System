# frozen_string_literal: true

class BookingMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booking_confirmation.subject
  #
  def booking_confirmation(customer, owner)
    @customer = customer
    @owner = owner
    mail to: @customer.email, subject: 'House Reservation Confirmation'
  end

  def house_approval(owner, admin)
    @admin = admin
    @owner = owner
    mail to: @owner.email, subject: 'House Approval Confirmation'
  end

  def house_disapproval(admin, owner)
    @admin = admin
    @owner = owner
    mail to: @owner.email, subject: 'House Rejection Confirmation'
  end

  def house_post(owner)
    @owner = owner
    mail to: 'zeelbhavsar06@gmail.com', subject: 'New House Added'
  end
end
