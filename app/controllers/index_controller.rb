class IndexController < ApplicationController
  def index
    @kills = Kill.all
    @latest_kill = Kill.order('created_at desc').first
    @first_kill = Kill.order('created_at asc').first
    @serial_killer = Player.order('kills desc').first
  end
end
