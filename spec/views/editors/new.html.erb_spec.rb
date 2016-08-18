require 'rails_helper'

RSpec.describe "editors/new.html.erb", type: :view do
  it "displays Register New Editor title correctly" do
  	render template: "editors/new.html.erb", layout: "layouts/application.html.erb"
  	expect(rendered).to have_title(/\ARegister new editor \| I'm Deri\z/)
  end
end
