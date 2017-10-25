require 'test_helper'

class AdvertisementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get advertisements_index_url
    assert_response :success
  end

  test "should get show" do
    get advertisements_show_url
    assert_response :success
  end

  test "should get new" do
    get advertisements_new_url
    assert_response :success
  end

  test "should get edit" do
    get advertisements_edit_url
    assert_response :success
  end

  test "should get delete" do
    get advertisements_delete_url
    assert_response :success
  end

end
