require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do

  before(:all) do
    @editor = create(:editor)
  end

  scenario "Login with invalid information" do
  	visit "admin/login"
  	fill_in "session[email]", :with => "foo@bar"
  	fill_in "session[password]", :with => "password"
  	click_button "Log in"
  	expect(page).to have_content('Invalid email or password combination')
  	visit '/'
  	expect(page).to_not have_content('Invalid email or password combination')
  end

  scenario "Login with valid information" do
  	visit "admin/login"
  	fill_in "session[email]", :with => @editor.email
  	fill_in "session[password]", :with => @editor.password
  	click_button "Log in"
  	expect(page).to have_text('Command Center')
  	expect(page).to have_button('Logout')
  	expect(page).to have_link(nil, :href => dashboard_path)
    click_button "Logout"
    expect(page).to_not have_button('Logout')
    expect(page).to_not have_link(nil, :href => dashboard_path)
  end

end
