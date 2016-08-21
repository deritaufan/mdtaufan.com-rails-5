require 'rails_helper'

RSpec.describe "editors/index", type: :view do

  it "displays the title correctly" do
  	render template: "editors/index.html.erb", layout: "layouts/application.html.erb"
  	expect(rendered).to have_title(/\AAll editors \| I'm Deri\z/)
  end
end
