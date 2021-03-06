class User < ActiveRecord::Base
    has_secure_password
    has_many :articles, dependent: :destroy
    
    before_save { self.email = email.downcase }
    
   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 30}
    validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: EMAIL_REGEX }
    
end