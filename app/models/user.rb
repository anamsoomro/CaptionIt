class User < ApplicationRecord
  has_many :comics
  has_many :captions

  validates :username, uniqueness: true
  # validates :username, format: { without: /\s/ }, message: 'Put some address please' 

  validate :check_empty_space

def check_empty_space
  if self.username.match(/\s+/)
    errors.add(:username, "cannot contain empty spaces, please try again.")
  end
end




  has_secure_password

  def likes 
    likes = 0 
    self.captions.each do |caption| 
      likes += caption.likes
    end
    likes
  end

  #user index page
  def self.funniest_order
    self.all.sort_by {|user| -user.likes}
  end

  def age 
    # now = {yr: Time.new.year, month: Time.new.month, day: Time.new.day}
    # born = {yr: self.created_at.year, month: self.created_at.month, day: self.created_at.day}
    # age = (now.to_a - born.to_a).to_h

    # now = {yr: Time.new.year, month: Time.new.month, day: Time.new.day, hr: Time.new.hour}
    # born = {yr: self.created_at.year, month: self.created_at.month, day: self.created_at.day, hr: self.created_at.day }
    # age = {yr: (now[:yr] - born[:yr]), month: (now[:month] - born[:month]), day: (now[:day] - born[:day]), hr: (now[:hr] - born[:hr]) }
    created = self.created_at
    today = DateTime.now
    born = Date.new(created.year, created.month, created.day)
    # born = Date.new(2020, 3, 1)
    age_days = (today - born).to_i
  end

  def self.top_3 
    self.funniest_order.slice(0,3)
  end

  def captions_ordered
    self.captions.sort_by {|caption| -caption.likes}
  end

end