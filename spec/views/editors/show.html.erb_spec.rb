require 'rails_helper'

RSpec.describe "editors/show", type: :view do

  it "displays the title correctly" do
  	new_editor = FactoryGirl.create(:editor)
  	assign(:editor, Editor.find(new_editor.id))
  	render template: "editors/show.html.erb", layout: "layouts/application.html.erb"
  	expect(rendered).to have_title(/\A#{new_editor.name} \| I'm Deri\z/)
  end
end
