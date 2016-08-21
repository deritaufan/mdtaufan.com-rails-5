require 'rails_helper'

RSpec.feature "UserSignups", type: :feature do
  scenario "Admin registers new editor with invalid information" do
  	visit 'editors/new'
  	fill_in "editor[name]", :with => ""
  	fill_in "editor[email]", :with => "invalid@email"
  	fill_in "editor[password]", :with => "meutia"
  	fill_in "editor[password_confirmation]", :with => "annisa"
  	expect {
  		click_button "Create Editor"
  	}.to change(Editor, :count).by(0)
  	expect(page).to have_css("div#error_explanation")
  	expect(page).to have_css("div.field_with_errors")
  end

  scenario "Admin regisers new editor with valid information" do
  	visit 'editors/new'
  	name = Faker::Name.name
  	fill_in "editor[name]", :with => name
  	fill_in "editor[email]", :with => Faker::Internet.email
  	fill_in "editor[password]", :with => "annisa"
  	fill_in "editor[password_confirmation]", :with => "annisa"
  	expect {
  		click_button "Create Editor"
  	}.to change(Editor, :count).by(1)
  	expect(page).to have_text("#{name} created.")
  end
end
