require 'rails_helper'

RSpec.describe "editors/new.html.erb", type: :view do

  it "displays the title correctly" do
  	assign(:editor, Editor.new)
  	render template: "editors/new.html.erb", layout: "layouts/application.html.erb"
  	expect(rendered).to have_title(/\ACreate new editor \| I'm Deri\z/)
  end
end
