require 'test_helper'

class ScanControllerTest < ActionController::TestCase
  test "should get paste" do
    get :paste
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

end
