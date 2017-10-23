require 'test_helper'

class TotalpostControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get totalpost_show_url
    assert_response :success
  end

  test "should get data_input" do
    get totalpost_data_input_url
    assert_response :success
  end

end
