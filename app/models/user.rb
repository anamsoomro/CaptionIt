class User < ApplicationRecord
  has_many :comics
  has_many :captions

  has_secure_password

  validates :username, uniqueness: true
  # validates :username, format: { without: /\s/ }, message: 'Put some address please' 

  validate :check_empty_space

  def check_empty_space
    if self.username.match(/\s+/)
      errors.add(:username, "cannot contain empty spaces, please try again.")
    end
  end
 
  def likes 
    likes = 0 
    self.captions.each do |caption| 
      likes += caption.likes
    end
    likes
  end

  def show_likes
    "#{self.likes} Knee Slaps"
  end

  #user index page
  def self.funniest_order
    self.all.sort_by {|user| -user.likes}
  end

  def age 
    created = self.created_at
    today = DateTime.now
    born = Date.new(created.year, created.month, created.day)
    age_days = (today - born).to_i
  end

  def self.top(x)
    self.funniest_order.slice(0,x)
  end

  def captions_ordered
    self.captions.sort_by {|caption| -caption.likes}
  end

  def images_ordered
    self.comics.sort_by {|image| -image.total_likes}
  end

  # active user order 

  # top 3 active users 

  def images_uploaded 
    self.comics.count
  end

  def captions_written
    self.captions.count
  end

  # images uploaded

  # captions_uploaded



end