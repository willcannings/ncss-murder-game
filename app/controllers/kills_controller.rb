class KillsController < ApplicationController
  before_filter :password_required
  
  def password_required
    return if Rails.env.development?
    authenticate_or_request_with_http_basic do |username, password|
      username == 'ncss' && password == 'ncss1102james_tara'
    end
  end
  
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
