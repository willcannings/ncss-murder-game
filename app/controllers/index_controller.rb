class IndexController < ApplicationController
  def index
    @kills = Kill.all
    @latest_kill = Kill.order('created_at desc').first
    @first_kill = Kill.order('created_at asc').first
    @serial_killer = Player.order('kills desc').first
    
    # convert the list of kills into a tree
    @nodes = {}
    @kills.each do |kill|
      killer = @nodes[kill.killer_id] ||= Node.new(kill.killer.name)
      killee = @nodes[kill.killee_id] ||= Node.new(kill.killee.name)
      killer.add_child(killee)
    end
    @roots = @nodes.values.select(&:root)
  end
end
