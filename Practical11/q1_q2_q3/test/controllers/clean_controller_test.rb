require 'test_helper'

class CleanControllerTest < ActionController::TestCase
  test "should get finish" do
    get :finish
    assert_response :success
  end

end
