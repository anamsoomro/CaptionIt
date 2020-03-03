class TopicsController < ApplicationController

  before_action :current_topic, only: [:show]

  def show 
    @comics = @topic.comics

  end

  private 

  def current_topic 
    @topic = Topic.find(params[:id])
  end


end
