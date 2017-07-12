require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get tweets_home_url
    assert_response :success
  end

  test "should get about" do
    get tweets_about_url
    assert_response :success
  end

end
