class Caption < ApplicationRecord
  belongs_to :user 
  belongs_to :comic



  def self.funniest_order 
    self.all.sort_by{|caption| -caption.likes}
  end

  def self.top(x)
    self.funniest_order.slice(0,x)
  end

  def self.latest_order
    self.all.sort_by {|caption| caption.created_at}.reverse
  end


  def self.latest(x)
    self.latest_order.slice(0,x)
  end

  # def show_caption 
  #   user = User.find(self.user_id)
  #   "#{self.text}" + " -" + "<%= link_to user.username, '/users/#{user.id}' %>".html_safe
  # end

  # def to_html(u)
  #   return <%=Link_to "#{u.username}", "/users/#{u.id}" %>
  # end
  

end
