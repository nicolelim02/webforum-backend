class User < ApplicationRecord
    has_secure_password
    has_many :posts

    validates_uniqueness_of :username, presence: true, unique: true
    validates :name, presence: true
    validates :email, presence: true
end
