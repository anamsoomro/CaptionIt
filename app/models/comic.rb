class Comic < ApplicationRecord
  belongs_to :user
  has_many :comic_topics
  has_many :topics, through: :comic_topics
  has_many :captions

  def total_likes 
    likes = 0
    self.captions.each do |caption| 
      likes += caption.likes 
    end
    likes 
  end

  def self.top_5 
    sorted_comics = Comic.all.sort_by {|comic| -comic.total_likes}
    top_5 = sorted_comics.slice(0,5)
  end

end
