require 'test_helper'

class HomePageLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
  	get root_path
  	assert_template "home_page/home"
  	assert_select "a[href=?]", "#portfolio"
  	assert_select "a[href=?]", "#about"
  	assert_select "a[href=?]", "#contact"
  end
end
