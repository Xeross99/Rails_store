require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get questions" do
    get static_pages_questions_url
    assert_response :success
  end

  test "should get news" do
    get static_pages_news_url
    assert_response :success
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end
end
