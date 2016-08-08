class ContactMailer < ApplicationMailer

  default to: "apps@mdtaufan.com"

  def contact_me(contact)
    @name = contact.name
    @email = contact.email
    @message = contact.message

    mail from: @email, subject: "Contact form message"
  end
end
