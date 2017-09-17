require 'test_helper'

class UserpgControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get userpg_index_url
    assert_response :success
  end

end
