class User < ActiveRecord::Base
  has_many :salutes
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
