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

  def self.top(x)
    Comic.all.sort_by {|comic| -comic.total_likes}.slice(0,x)
  end

  def funniest_caption_order
    self.captions.sort_by{|caption| -caption.likes}
  end

  def funniest_caption 
    if !self.captions.empty?
      funniest_caption_order.first
    end 
  end

  def self.sort_by_latest
    self.all.sort_by {|comic| comic.created_at}.reverse
  end

  def self.sort_by_funniest
    self.all.sort_by {|comic| -comic.total_likes}
  end

  def self.latest(x)
    sorted = self.sort_by_latest
    sorted.slice(0, x)
  end
end
