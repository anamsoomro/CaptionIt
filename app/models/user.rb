class User < ApplicationRecord
  has_many :comics
  has_many :captions

  validates :username, format: { without: /\s/ }

  has_secure_password
end