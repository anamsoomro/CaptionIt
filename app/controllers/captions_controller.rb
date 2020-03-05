class CaptionsController < ApplicationController

  before_action :current_caption, only: [:like, :edit, :update, :destroy]
  # skip_action :verify_authenticity_token

  def edit 

  end

  def update
    # params = {"_method"=>"patch", "authenticity_token"=>"WXXV5rbs7/WnE5WDFCb0cXqLzW3w7aH9Nq1pjrzF2eLjYQYuuBt9iSTzTtvdLJ1L99JYVT0x6cHaqW5vu18NkQ==", "caption"=>{"text"=>"when you put a byebug but dont even hit the byebug ", "likes"=>"0", "comic_id"=>"35"}, "commit"=>"Update Caption", "controller"=>"captions", "action"=>"update", "id"=>"41"}
    # byebug
    @caption.update(text: update_caption_params[:text])
    redirect_to comic_path(update_caption_params[:comic_id])
  end


  def like 
    # byebug
    @caption.increment!(:likes)
    redirect_to redirect_params[:page]
  end

  def create 
    # byebug
    Caption.create(likes: 0, text: caption_params[:text], comic_id: caption_params[:comic_id], user_id: session[:user_id])
    redirect_to comic_path(caption_params[:comic_id])
  end

  def destroy 
    # byebug
    @caption.destroy
    redirect_to comic_path(@caption.comic_id)
  end

  private 

  def current_caption 
    # byebug
    @caption = Caption.find(params[:id])
  end

  def caption_params 
    # params.require(:caption).permit(:text, :comic_id)
    params.permit(:text, :comic_id)
  end

  def update_caption_params 
    params.require(:caption).permit(:text, :comic_id)
  end

  def redirect_params 
    params.permit(:page)
  end

 

end
