require 'test_helper'

class TodoListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todo_lists_index_url
    assert_response :success
  end

  test "should get show" do
    get todo_lists_show_url
    assert_response :success
  end

end
