require 'test_helper'

class QuestionviewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get questionview_index_url
    assert_response :success
  end

  test "should get next" do
    get questionview_next_url
    assert_response :success
  end

  test "should get prev" do
    get questionview_prev_url
    assert_response :success
  end

end
