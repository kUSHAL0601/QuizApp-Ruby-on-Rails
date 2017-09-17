require 'test_helper'

class LeaderboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get leaderboard_index_url
    assert_response :success
  end

  test "should get bygen" do
    get leaderboard_bygen_url
    assert_response :success
  end

  test "should get bysubgen" do
    get leaderboard_bysubgen_url
    assert_response :success
  end

end
