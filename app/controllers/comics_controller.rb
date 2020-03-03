class ComicsController < ApplicationController

  before_action :current_comic, only: [:show, :destroy, :edit, :update]

  def index
    # @comics = Comic.all 
    @top_5_comics = Comic.top_5
    @topics = Topic.all 
  end

  def show 
    @user = User.find(@comic.user_id)
    @captions = @comic.captions
    @topics = @comic.topics
  end

  def new 
    @comic = Comic.new
    @topics = Topic.all
  end

  def create 
    # byebug
    @comic = Comic.create(image_url: comic_params[:image_url], user_id: User.first.id)
    comic_params[:topic_ids].reject(&:blank?).each do |topic_id|
      ComicTopic.create(comic_id: @comic.id, topic_id: topic_id)
    end
    redirect_to comic_path(@comic)
  end

  def edit 
    @topics = Topic.all
  end

  def update 
    @comic.comic_topics.each {|comic_tag| comic_tag.destroy}
    comic_params[:topic_ids].reject(&:blank?).each do |topic_id|
      ComicTopic.create(comic_id: @comic.id, topic_id: topic_id)
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
    byebug
    @caption.increment!(:likes)
    redirect_to comic_path(@caption.comic_id)
  end

  private 

  def current_comic
    @comic = Comic.find(params[:id])
  end

  def comic_params 
    params.require(:comic).permit(:image_url, topic_ids:[])
  end




end
