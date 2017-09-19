require 'test_helper'

class SubGenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_genre = sub_genres(:one)
  end

  test "should get index" do
    get sub_genres_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_genre_url
    assert_response :success
  end

  test "should create sub_genre" do
    assert_difference('SubGenre.count') do
      post sub_genres_url, params: { sub_genre: { gen: @sub_genre.gen, subgen: @sub_genre.subgen } }
    end

    assert_redirected_to sub_genre_url(SubGenre.last)
  end

  test "should show sub_genre" do
    get sub_genre_url(@sub_genre)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_genre_url(@sub_genre)
    assert_response :success
  end

  test "should update sub_genre" do
    patch sub_genre_url(@sub_genre), params: { sub_genre: { gen: @sub_genre.gen, subgen: @sub_genre.subgen } }
    assert_redirected_to sub_genre_url(@sub_genre)
  end

  test "should destroy sub_genre" do
    assert_difference('SubGenre.count', -1) do
      delete sub_genre_url(@sub_genre)
    end

    assert_redirected_to sub_genres_url
  end
end
