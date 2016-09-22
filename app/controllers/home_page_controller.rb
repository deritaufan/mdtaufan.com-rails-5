class HomePageController < ApplicationController
  def home
    @contact = Contact.new
  end

  def contact
    create_contact = Contact.create(contact_params)
    if create_contact.valid?
      ContactMailer.contact_me(create_contact).deliver_now
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
