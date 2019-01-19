require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
#verify that root url is set to static_pages#home
  test "should get root" do
    get root_url
    assert_response static_pages_home_url
  end


  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About"
  end
end