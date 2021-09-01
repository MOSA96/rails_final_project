require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  
  def setup
  @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  #test "should get root" do
    #get '/'
    #assert_response :success
    #assert_select "title", "Ruby on Rails Tutorial Sample App"
  #end
   
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App | Home"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App | Help"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App | About"

  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App | Contact"

  end

  test "should get market" do
    get market_path
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App | Market"

  end


 # test "should get singup" do
    #get static_pages_singup_url
   # assert_response :success
  #end
end
