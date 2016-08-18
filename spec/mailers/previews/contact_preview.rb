# Preview all emails at http://localhost:3000/rails/mailers/contact
class ContactPreview < ActionMailer::Preview
	def contact_me
		ContactMailer.contact_me(Contact.first)
	end
end
