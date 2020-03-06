class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booking_confirmation.subject
  #
  def booking_confirmation(customer_fname,customer_lname,owner_fname,owner_lname,customer_email)
    @customer_fname = customer_fname
    @customer_lname = customer_lname
    @owner_fname = owner_fname
    @owner_lname = owner_lname
    @customer_email = customer_email
    mail to: , subject: "House Reservation Confirmation"
  end
end
