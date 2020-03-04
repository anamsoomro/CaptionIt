class User < ApplicationRecord
  has_many :comics
  has_many :captions

  def likes 
    likes = 0 
    self.captions.each do |caption| 
      likes += caption.likes
    end
    likes
  end

  def self.funniest_order
    User.all.sort_by {|user| -user.likes}
  end
end