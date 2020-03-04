class TopicsController < ApplicationController

  before_action :current_topic, only: [:show]
  before_action :random_comic, only: [:index, :show]


  def index
    @topics = Topic.order_by_images
  end

  def show 
    @comics = @topic.comics
  end

  private 

  def current_topic 
    @topic = Topic.find(params[:id])
  end

  def random_comic 
    @random_comic = Comic.all.sample
  end


end
