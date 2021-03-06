require 'rails_helper'

RSpec.describe HomePageController, type: :controller do
	
	describe "GET #home" do
		
		it "responds successfully with an http 200 status code" do
			get :home
			expect(response).to be_success
			expect(response).to have_http_status(:success)
		end

		it "renders the home template" do
			get :home
			expect(response).to render_template :home
		end
	end
end
