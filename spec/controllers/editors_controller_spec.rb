require 'rails_helper'

RSpec.describe EditorsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
    	get :new
    	expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "when information is invalid" do
      it "renders new template" do
        post :create, params: { editor: { name: '', email: 'deri@taufan', password: 'foo', confirm_password: 'bar' } }
        expect(response).to render_template(:new)
      end
    end

    context "when information is valid" do
      it "redirects to editors_url" do
        post :create, params: { editor: { name: Faker::Name.name, 
                                          email: Faker::Internet.email, 
                                          password: "annisa", 
                                          password_confirmation: "annisa" } }
        expect(response).to redirect_to(editors_url)
      end
    end
  end

end
