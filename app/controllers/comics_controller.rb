class ComicsController < ApplicationController

  before_action :current_comic, only: [:show]

  def show 
    @user = User.find_by(@comic.user_id)
  end

  def new 

  end

  def edit 

  end

  def update 

  end

  def destroy
  
  end

  private 

  def current_comic
    @comic = Comic.find(params[:id])
  end




end
