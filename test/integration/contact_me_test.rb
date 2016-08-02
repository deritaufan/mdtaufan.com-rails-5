require 'test_helper'

class ContactMeTest < ActionDispatch::IntegrationTest
  # test "invalid contact me information" do
  # 	get root_path
  # 	assert_no_difference 'Contact.count' do
  # 		post contact_path, params: { name: "",
  # 									 email: "user@invalid",
  # 									 message: "" }
  # 	end
  # 	assert_select 'span.help-block.form-error', count: 3
  # end
end
