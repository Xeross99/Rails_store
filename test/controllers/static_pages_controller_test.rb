require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get questions" do
    get questions_url
    assert_response :success
  end

  test "should get news" do
    get news_url
    assert_response :success
  end

  test "should get contact" do
    get contact_url
    assert_response :success
  end
end
