require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  
  def setup
  @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  test "should get root" do
    get '/'
    assert_response :success
  end
   
  test "should get home" do
    get '/home'
    assert_response :success
    assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get '/help'
    assert_response :success
    assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
  end

  test "should get about" do
    get '/about'
    assert_response :success
    assert_select "title", "About | Ruby on Rails Tutorial Sample App"

  end

  #test "should get contact" do
    #get static_pages_contact_url
    #assert_response :success
  #end

 # test "should get singup" do
    #get static_pages_singup_url
   # assert_response :success
  #end
end
