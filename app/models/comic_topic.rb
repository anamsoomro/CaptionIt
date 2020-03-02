class ComicTopic < ApplicationRecord
  belongs_to :comic
  belongs_to :topic
end
