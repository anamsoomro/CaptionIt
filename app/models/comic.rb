class Comic < ApplicationRecord
  belongs_to :user
  has_many :comic_topics
  has_many :topics, through: :comic_topics
  has_many :captions
end
