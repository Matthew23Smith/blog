class Article < ActiveRecord::Base
    
    validates :description, presence: true, length: { minimum: 30, maximum: 400};
    validates :title, presence: true, length: {minimum: 10, maximum: 50}
    
end