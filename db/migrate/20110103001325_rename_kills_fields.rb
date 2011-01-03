class RenameKillsFields < ActiveRecord::Migration
  def self.up
    rename_column :kills, :player_1_id, :killer_id
    rename_column :kills, :player_2_id, :killee_id
  end

  def self.down
    rename_column :kills, :killee_id, :player_2_id
    rename_column :kills, :killer_id, :player_1_id
  end
end
