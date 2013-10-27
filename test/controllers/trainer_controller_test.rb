require 'test_helper'

class TrainerControllerTest < ActionController::TestCase
  test "should get number" do
    get :number
    assert_response :success
  end

  test "should get direction" do
    get :direction
    assert_response :success
  end

  test "should get color" do
    get :color
    assert_response :success
  end

end
