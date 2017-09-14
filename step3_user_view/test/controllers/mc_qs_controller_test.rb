require 'test_helper'

class McQsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mcq = mcqs(:one)
  end

  test "should get index" do
    get mcqs_url
    assert_response :success
  end

  test "should get new" do
    get new_mcq_url
    assert_response :success
  end

  test "should create mcq" do
    assert_difference('Mcq.count') do
      post mcqs_url, params: { mcq: { corrOpt: @mcq.corrOpt, gen: @mcq.gen, optA: @mcq.optA, optB: @mcq.optB, optC: @mcq.optC, optD: @mcq.optD, question: @mcq.question, subgen: @mcq.subgen } }
    end

    assert_redirected_to mcq_url(Mcq.last)
  end

  test "should show mcq" do
    get mcq_url(@mcq)
    assert_response :success
  end

  test "should get edit" do
    get edit_mcq_url(@mcq)
    assert_response :success
  end

  test "should update mcq" do
    patch mcq_url(@mcq), params: { mcq: { corrOpt: @mcq.corrOpt, gen: @mcq.gen, optA: @mcq.optA, optB: @mcq.optB, optC: @mcq.optC, optD: @mcq.optD, question: @mcq.question, subgen: @mcq.subgen } }
    assert_redirected_to mcq_url(@mcq)
  end

  test "should destroy mcq" do
    assert_difference('Mcq.count', -1) do
      delete mcq_url(@mcq)
    end

    assert_redirected_to mcqs_url
  end
end
