require 'test_helper'

class CategoriesindexControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get categoriesindex_new_url
    assert_response :success
  end

  test "should get delete" do
    get categoriesindex_delete_url
    assert_response :success
  end

  test "should get show" do
    get categoriesindex_show_url
    assert_response :success
  end

  test "should get edit" do
    get categoriesindex_edit_url
    assert_response :success
  end

end
