require 'test_helper'

class SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get query" do
    get searches_query_url
    assert_response :success
  end

  test "should get references:user" do
    get searches_references:user_url
    assert_response :success
  end

end
