class Schedule < ActiveRecord::Base	
  attr_accessible :attachment, :description, :attachment_cache
  mount_uploader :attachment, ScheduleUploader
  validates :attachment, :description, presence: true
end
