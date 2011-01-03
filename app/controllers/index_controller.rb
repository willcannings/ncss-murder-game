class IndexController < ApplicationController
  def index
    @kills = Kill.all
    @latest_kill = Kill.order('created_at desc').first
    @first_kill = Kill.order('created_at asc').first
    @serial_killer = Player.order('kills desc').first
    
    # create the graph kill data
    kill_data = Kill.all.collect {|kill| "\"#{kill.killer.name}\" -> \"#{kill.killee.name}\";"}.join("\n")
    
    # draw the graph
    pipe = IO.popen('/usr/bin/env dot -q -Tsvg', 'w+')
    pipe.puts "digraph kills { #{kill_data} }"
    pipe.close_write
    @graph_data = pipe.read
  end
end
