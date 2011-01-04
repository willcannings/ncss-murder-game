class Kill < ActiveRecord::Base
  belongs_to :killer, class_name: 'Player'
  belongs_to :killee, class_name: 'Player'
  
  after_save do |kill|
    kill.killer.kills = Kill.where(killer_id: kill.killer_id).count
    kill.killer.save
  end
end
