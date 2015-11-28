require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest 
  
  def setup
    @user = User.create(username: 'hello', email: 'hello@example.com', password: 'password', admin: true)
  end
  
  test 'Get new Category form and create Category' do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: { name: "sports"}
    end
    assert_template 'categories/show'
    assert_match 'sport', response.body
  end
  
  test 'Get an invalid on creating category cause blank submission' do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'new'
    assert_no_difference 'Category.count' do
      post_via_redirect categories_path, category: { name: ' '}
    end
    assert_template 'categories/new'
    assert_match "2 errors", response.body
  end
  
end
  
