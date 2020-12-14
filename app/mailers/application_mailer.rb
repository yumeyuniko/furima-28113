class ApplicationMailer < ActionMailer::Base
  default from: ENV['GMAIL_ADRESS']
  layout 'mailer'
end
