class ContactMailer < ApplicationMailer
  default from: "daigocafe22@gmail.com"   # 送信元アドレス

  def received_email(contact)
    @contact= contact
    mail(:to => contact.email, :subject => 'お問い合わせを承りました')
  end
end
