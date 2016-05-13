require 'test_helper'

class FlatmatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get flatmates_new_url
    assert_response :success
  end

end
