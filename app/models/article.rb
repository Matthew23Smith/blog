class Article < ActiveRecord::Base
    
    belongs_to :user
    
    validates :description, presence: true, length: { minimum: 30, maximum: 400};
    validates :title, presence: true, length: {minimum: 10, maximum: 50}
    validates :user_id, presence: true
    
end