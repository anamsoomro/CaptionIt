class CaptionsController < ApplicationController

  before_action :current_caption, only: [:like]

  def like 
    # byebug
    @caption.increment!(:likes)
    redirect_to comic_path(@caption.comic_id)
  end

  private 

  def current_caption 
    # byebug
    @caption = Caption.find(params[:caption_id])
  end

  def caption_params 
    params.require(:caption).permit(:caption_id, :likes, :text)
  end
end
