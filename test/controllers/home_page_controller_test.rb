require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "I'm Deri"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

end
