require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "sport") 
    end
    
    test "category should be valid" do
        assert @category.valid?
    end
    
    test 'category should not be empty' do
        @category.name = " "
        assert_not @category.valid?
    end
    
    test 'Category Should be Unique' do
        @category.save
        category2 = Category.new(name: 'sport')
        assert_not category2.valid?
    end
    
    test 'Category Uniqueness is case sensitive' do 
        @category.save
        category3 = Category.new( name: 'SpOrt')
        assert_not category3.valid?
    end

    test 'Category Should not be to short' do
        @category.name = 'aa'
        assert_not @category.valid?
    end
    
    test 'Category Should not be to long' do
        @category.name = 'a' * 20
        assert_not @category.valid?
    end
end