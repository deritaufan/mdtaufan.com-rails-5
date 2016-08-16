class HomePageController < ApplicationController
  def home
    @contact = Contact.new
  end

  def contact
    create_contact = Contact.create(contact_params)
    if create_contact.valid?
      ContactMailer.contact_me(create_contact).deliver_now
      #html = render_to_string :partial => 'contact_response', :locals => {:create_contact => create_contact}
      respond_to do |format|
        #format.json { render :json => {:success => true, :html => html} }
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
