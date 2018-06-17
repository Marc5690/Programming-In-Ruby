require 'test_helper'

class TreatControllerTest < ActionController::TestCase
  test "should get trick" do
    get :trick
    assert_response :success
  end

end
