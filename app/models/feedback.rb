class Feedback < ActiveRecord::Base
  belongs_to :resource_person
  belongs_to :course
  attr_accessible :communication_skill, :competency_subject, :quality_lecture, :usefulness_topic, :resource_person_id, :course_id
end

#field not remain blank
class  Feedback < ActiveRecord::Base
  validates :communication_skill, :competency_subject, :quality_lecture, :usefulness_topic, :resource_person_id, :course_id, presence: true
end