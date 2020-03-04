class Topic < ApplicationRecord
  has_many :comic_topics
  has_many :comics, through: :comic_topics


  def num_images 
    self.comics.count
  end

  def self.order_by_images
    self.all.sort_by {|topic| -topic.num_images}
  end


end
