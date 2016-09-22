require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

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

  before(:context) do
  	@editor = create(:editor)
  end

  describe "POST #create" do
  	context "when information is invalid" do
  		it "renders the new template" do
  			post :create, params: { session: { email: @editor.email, password: '123456' } }
  			expect(response).to render_template :new
  		end
  	end
  end

end
