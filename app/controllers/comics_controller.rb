class ComicsController < ApplicationController

  before_action :current_comic, only: [:show, :destroy, :edit, :update, :create_joiners]

  def index
    @comics = Comic.all 
    # @top_5_comics = Comic.top_5
    @topics = Topic.all 
    @random_comic = Comic.all.sample 
  end

  def show 
    @user = User.find(@comic.user_id)
    @captions = @comic.captions
    @topics = @comic.topics
    @random_comic = Comic.all.sample
  end

  def new 
    @comic = Comic.new
    @topics = Topic.all.sort_by{|topic| topic.label}
  end

  def create 
    # byebug
    @comic = Comic.create(image_url: comic_params[:image_url], user_id: User.first.id) #user has to be updated to current user
    if comic_params[:topic_name] == ""
      if comic_params[:topic_ids].count > 1
        create_joiners
      end
    else 
      new_topic = Topic.create(label: comic_params[:topic_name].capitalize)
      ComicTopic.create(comic_id: @comic.id, topic_id: new_topic.id)
      if comic_params[:topic_ids].count > 1
        create_joiners
      end
    end
    redirect_to comic_path(@comic)
  end

  
  def edit 
    @topics = Topic.all.sort_by{|topic| topic.label}
  end

  def update 
    @comic.comic_topics.each {|comic_tag| comic_tag.destroy}
    if comic_params[:topic_name] == ""
      if comic_params[:topic_ids].count > 1
        create_joiners
      end
    else 
      new_topic = Topic.create(label: comic_params[:topic_name].capitalize)
      ComicTopic.create(comic_id: @comic.id, topic_id: new_topic.id)
      if comic_params[:topic_ids].count > 1
        create_joiners
      end
    end
    redirect_to comic_path(@comic)
  end

  def destroy
    @comic.comic_topics.each do |comic_topic|
      comic_topic.destroy
    end
    @comic.destroy
    redirect_to comics_path
  end

  def like 
    # byebug
    @caption.increment!(:likes)
    redirect_to comic_path(@caption.comic_id)
  end

  private 

  def current_comic
    @comic = Comic.find(params[:id])
  end

  def comic_params 
    params.require(:comic).permit(:image_url, :topic_name, topic_ids:[])
  end

  def create_joiners 
    comic_params[:topic_ids].reject(&:blank?).each do |topic_id|
      ComicTopic.create(comic_id: @comic.id, topic_id: topic_id)
    end
  end




end
