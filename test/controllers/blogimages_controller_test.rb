require 'test_helper'

class BlogimagesControllerTest < ActionController::TestCase
  setup do
    @blogimage = blogimages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blogimages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blogimage" do
    assert_difference('Blogimage.count') do
      post :create, blogimage: { caption: @blogimage.caption, preview_color: @blogimage.preview_color, title: @blogimage.title }
    end

    assert_redirected_to blogimage_path(assigns(:blogimage))
  end

  test "should show blogimage" do
    get :show, id: @blogimage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blogimage
    assert_response :success
  end

  test "should update blogimage" do
    patch :update, id: @blogimage, blogimage: { caption: @blogimage.caption, preview_color: @blogimage.preview_color, title: @blogimage.title }
    assert_redirected_to blogimage_path(assigns(:blogimage))
  end

  test "should destroy blogimage" do
    assert_difference('Blogimage.count', -1) do
      delete :destroy, id: @blogimage
    end

    assert_redirected_to blogimages_path
  end
end
