class User < ApplicationRecord
    has_secure_password

    validates_uniqueness_of :username, presence: true, unique: true
    validates :name, presence: true
    validates :email, presence: true
end
