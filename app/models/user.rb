class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :uid, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :twitter_uid, uniqueness: true, allow: nil

  has_secure_password
end
