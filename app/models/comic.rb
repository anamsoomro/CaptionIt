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

  #comic index page
  def self.top_5 
    sorted_comics = Comic.all.sort_by {|comic| -comic.total_likes}
    top_5 = sorted_comics.slice(0,5)
  end

  #comic show page
  def funniest_caption_order
    self.captions.sort_by{|caption| -caption.likes}
  end

  #Comic show page
  def funniest_caption 
    if !self.captions.empty?
      funniest_caption_order.first
    end 
  end

  #comic index page
  def self.sort_by_latest
    self.all.sort_by {|comic| -comic.created_at}
  end

  #comic index page
  def self.sort_by_funniest
    self.all.sort_by {|comic| -comic.total_likes}
  end
end
