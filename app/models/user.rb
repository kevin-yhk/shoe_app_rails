class User < ApplicationRecord
    has_many :reviews
    has_many :shoes, through: :reviews
    
    has_secure_password
    validates :username, :email, uniqueness: true
    validates :username, :email, presence: true
end
