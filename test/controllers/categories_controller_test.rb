require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @category = Category.create(name: 'sports')
    @user = User.create(username: 'hello', email: 'hello@example.com', password: 'password', admin: true)
  end
  
  test 'get index' do
    get :index
    assert_response :success
  end
  
  test 'get new ' do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end
  
  test 'Get show' do
    get(:show, {'id' => @category.id})
    assert_response :success
  end
  
  test 'Test admin permisions' do
    assert_no_difference 'Category.count' do
      post :create, category: {name: 'sports'}
    end
    assert_redirected_to categories_path
  end
  
end