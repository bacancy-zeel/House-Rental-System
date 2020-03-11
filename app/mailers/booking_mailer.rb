# frozen_string_literal: true

class BookingMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booking_confirmation.subject
  #
  def booking_confirmation(customer_fname, customer_lname, owner_fname, owner_lname, customer_email)
    @customer_fname = customer_fname
    @customer_lname = customer_lname
    @owner_fname = owner_fname
    @owner_lname = owner_lname
    @customer_email = customer_email
    mail to: @customer_email, subject: 'House Reservation Confirmation'
  end

  def house_approval(admin_fname, admin_lname, owner_fname, owner_lname, owner_email)
    @admin_fname = admin_fname
    @admin_lname = admin_lname
    @owner_fname = owner_fname
    @owner_lname = owner_lname
    @owner_email = owner_email
    mail to: @owner_email, subject: 'House Approval Confirmation'
  end

  def house_disapproval(admin_fname, admin_lname, owner_fname, owner_lname, owner_email)
    @admin_fname = admin_fname
    @admin_lname = admin_lname
    @owner_fname = owner_fname
    @owner_lname = owner_lname
    @owner_email = owner_email
    mail to: @owner_email, subject: 'House Rejection Confirmation'
  end
end
