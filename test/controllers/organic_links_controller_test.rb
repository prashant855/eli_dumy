require 'test_helper'

class OrganicLinksControllerTest < ActionController::TestCase
  setup do
    @organic_link = organic_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organic_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organic_link" do
    assert_difference('OrganicLink.count') do
      post :create, organic_link: { link: @organic_link.link, name: @organic_link.name, options: @organic_link.options, search: @organic_link.search }
    end

    assert_redirected_to organic_link_path(assigns(:organic_link))
  end

  test "should show organic_link" do
    get :show, id: @organic_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organic_link
    assert_response :success
  end

  test "should update organic_link" do
    patch :update, id: @organic_link, organic_link: { link: @organic_link.link, name: @organic_link.name, options: @organic_link.options, search: @organic_link.search }
    assert_redirected_to organic_link_path(assigns(:organic_link))
  end

  test "should destroy organic_link" do
    assert_difference('OrganicLink.count', -1) do
      delete :destroy, id: @organic_link
    end

    assert_redirected_to organic_links_path
  end
end
