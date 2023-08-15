class User < ApplicationRecord
  has_many :pets
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
