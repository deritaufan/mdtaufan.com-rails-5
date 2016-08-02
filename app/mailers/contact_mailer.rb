class ContactMailer < ApplicationMailer

  default to: "apps@mdtaufan.com"

  def contact_me(name, email, message)
    @name = name
    @email = email
    @message = message

    mail from: @email, subject: "Contact form message"
  end
end
