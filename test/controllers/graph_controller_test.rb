require 'test_helper'

class GraphControllerTest < ActionDispatch::IntegrationTest
  test "should get getchart" do
    get graph_getchart_url
    assert_response :success
  end

end
