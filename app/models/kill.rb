class Kill < ActiveRecord::Base
  belongs_to :killer, class_name: 'Player'
  belongs_to :killee, class_name: 'Player'
  
  after_save do |kill|
    kill.killer.increment(:kills)
  end
end
