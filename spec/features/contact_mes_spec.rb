require 'rails_helper'

RSpec.feature "ContactMes", type: :feature do
  scenario "Guest sends a new message", :js => true do
  	visit "/"
  	fill_in "contact[name]", :with => "Guest"
  	fill_in "contact[email]", :with => "guest@example.com"
  	fill_in "contact[message]", :with => "Test message"
  	expect{
  		click_button "Send"
  	}.to change(Contact, :count).by(1)
  	expect(page).to have_text("Thank you for your message!")
  end

  scenario "Guest sends a invalid message", :js => true do
  	visit "/"
  	fill_in "contact[name]", :with => ""
  	fill_in "contact[email]", :with => ""
  	fill_in "contact[message]", :with => ""
    expect{
      click_button "Send"
    }.to change(Contact, :count).by(0)
  	expect(page).to have_text("Name cannot be empty")
  	expect(page).to have_text("A valid email address is required")
  	expect(page).to have_text("Message cannot be empty")
  end
  	
end
