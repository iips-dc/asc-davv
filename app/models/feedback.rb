class Feedback < ActiveRecord::Base
  belongs_to :resource_person
  attr_accessible :communication_skill, :competency_subject, :quality_lecture, :usefulness_topic
end
