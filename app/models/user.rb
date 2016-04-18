class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true,
                    uniqueness: true

  validates :username, presence: true
end
