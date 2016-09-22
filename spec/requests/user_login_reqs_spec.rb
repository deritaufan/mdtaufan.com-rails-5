require 'rails_helper'

RSpec.describe "UserLoginReqs", type: :request do

	before(:all) do
    @editor = create(:editor)
  end

  describe "POST /admin/login" do
    it "redirects to login page on invalid information" do
    	get login_path
    	expect(response).to render_template(:new)
    	post login_path, params: { session: { email: "", password: "" } }
    	expect(response).to render_template(:new)
    	expect(flash).to_not be_empty
    	get root_path
    	expect(flash).to be_empty
    end

    it "redirects to dashboard on valid information and logs it out" do
    	editor = create(:editor)
    	get login_path
    	post login_path, params: { session: { email: @editor.email, password: @editor.password } }
    	expect(is_logged_in?).to be true
    	expect(response).to redirect_to(dashboard_path)
    	follow_redirect!
    	expect(response).to render_template(:dashboard)
    	delete logout_path
    	expect(is_logged_in?).to_not be true
    	follow_redirect!
    	expect(response).to render_template(:new)
    end
  end
end
