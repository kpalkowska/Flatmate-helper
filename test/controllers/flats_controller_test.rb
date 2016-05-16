require 'test_helper'

class FlatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get flats_new_url
    assert_response :success
  end

end
