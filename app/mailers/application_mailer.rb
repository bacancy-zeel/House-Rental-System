# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'from@gmail.com'
  layout 'mailer'
end
