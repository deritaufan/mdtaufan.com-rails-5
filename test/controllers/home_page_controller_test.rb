require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "I'm Deri"
  end

  test "should get home" do
    get home_page_home_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

end
