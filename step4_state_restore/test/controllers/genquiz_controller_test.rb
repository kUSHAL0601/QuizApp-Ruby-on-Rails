require 'test_helper'

class GenquizControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get genquiz_create_url
    assert_response :success
  end

end
