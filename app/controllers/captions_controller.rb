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
    @caption = Caption.find(params[:id])
  end

  def caption_params 
    params.require(:caption).permit(:likes, :text)
  end

end
