require 'rails_helper'

RSpec.describe "home_page/home.html.erb", type: :view do
	
	it "displays the title correctly" do
		assign(:contact, FactoryGirl.build(:contact))
		render template: "home_page/home.html.erb", layout: "layouts/application.html.erb"
		expect(rendered).to have_title(/\AI'm Deri\z/)
	end
end
