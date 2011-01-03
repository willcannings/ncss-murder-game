class AddLocationToKills < ActiveRecord::Migration
  def self.up
    add_column :kills, :location, :string
  end

  def self.down
    remove_column :kills, :location
  end
end
