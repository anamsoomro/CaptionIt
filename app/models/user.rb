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
    User.all.sort_by {|user| -user.likes}
  end

end