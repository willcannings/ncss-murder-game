class CacheKills < ActiveRecord::Migration
  def self.up
    add_column :players, :kills, :integer
  end

  def self.down
    remove_column :players, :kills
  end
end
