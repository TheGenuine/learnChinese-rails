require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get lessons" do
    get :lessons
    assert_response :success
  end

  test "should get words" do
    get :words
    assert_response :success
  end

  test "should get concepts" do
    get :concepts
    assert_response :success
  end

end
