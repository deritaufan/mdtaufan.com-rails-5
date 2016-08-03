require 'test_helper'

class ContactMeTest < ActionDispatch::IntegrationTest
  test "valid contact me information" do
  	get root_path
  	assert_difference 'Contact.count', 1 do
  		post contact_path, params: { name: "Guest",
  									 email: "user@mdtaufan.com",
  									 message: "Test message" }, xhr: true
  	end
  	#assert_select 'div.alert.alert-success', "Thank you for your message!"
  end
end
