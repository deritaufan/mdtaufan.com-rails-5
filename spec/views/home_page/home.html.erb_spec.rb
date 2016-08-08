require 'rails_helper'

RSpec.describe "home_page/home" do
	it "displays the title correctly" do
		render template: "home_page/home.html.erb", layout: "layouts/application.html.erb"
		expect(rendered).to have_title(/\AI'm Deri\z/)
	end
end
