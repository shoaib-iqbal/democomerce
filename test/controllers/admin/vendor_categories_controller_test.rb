require 'test_helper'

class Admin::VendorCategoriesControllerTest < ActionController::TestCase
  setup do
    @admin_vendor_category = admin_vendor_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_vendor_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_vendor_category" do
    assert_difference('Admin::VendorCategory.count') do
      post :create, admin_vendor_category: { type: @admin_vendor_category.type, user_id: @admin_vendor_category.user_id }
    end

    assert_redirected_to admin_vendor_category_path(assigns(:admin_vendor_category))
  end

  test "should show admin_vendor_category" do
    get :show, id: @admin_vendor_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_vendor_category
    assert_response :success
  end

  test "should update admin_vendor_category" do
    patch :update, id: @admin_vendor_category, admin_vendor_category: { type: @admin_vendor_category.type, user_id: @admin_vendor_category.user_id }
    assert_redirected_to admin_vendor_category_path(assigns(:admin_vendor_category))
  end

  test "should destroy admin_vendor_category" do
    assert_difference('Admin::VendorCategory.count', -1) do
      delete :destroy, id: @admin_vendor_category
    end

    assert_redirected_to admin_vendor_categories_path
  end
end
