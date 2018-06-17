require 'test_helper'

class CalculationControllerTest < ActionController::TestCase
  test "should get enter" do
    get :enter
    assert_response :success
  end

  test "should get calculate" do
    get :calculate
    assert_response :success
  end

  test "should get errorhandling" do
    get :errorhandling
    assert_response :success
  end

end
