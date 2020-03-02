class Topic < ApplicationRecord
  has_many :comic_topics
  has_many :comics, through: :comic_topics
end
