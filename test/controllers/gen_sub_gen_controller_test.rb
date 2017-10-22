require 'test_helper'

class GenSubGenControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get gen_sub_gen_create_url
    assert_response :success
  end

end
