class CreateKills < ActiveRecord::Migration
  def self.up
    create_table :kills do |t|
      t.integer  :player_1_id
      t.integer  :player_2_id
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :kills
  end
end
