# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/contact_me

  def contact_me
  	@contact = Contact.first
    ContactMailer.contact_me(@contact.name, @contact.email, @contact.message)	
  end

end
