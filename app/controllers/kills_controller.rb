class KillsController < ApplicationController
  def index
    @kills = Kill.all
  end
  
  def new
    @kill = Kill.new
  end
  
  def create
    @kill = Kill.create(params[:kill])
    if @kill.save
      redirect_to kills_path
    else
      render action: 'new'
    end
  end
end
