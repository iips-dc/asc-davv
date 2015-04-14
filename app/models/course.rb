class Course < ActiveRecord::Base
  has_many :shortterm_courses
  has_many :refresher_courses
  has_many :orientation_courses
  has_many :interaction_programs
  has_many :feedbacks
  belongs_to :resource_person
  attr_accessible :course_name, :description, :end_date, :start_date, :course_type, :session, :resource_person_id
end

#field not remain blank
class  Course < ActiveRecord::Base
  validates :course_name, :description, :end_date, :start_date, :course_type, :resource_person_id, :session, presence: true
end

#length of the fields
class Course < ActiveRecord::Base
  validates :course_name, :description, :course_type, length: { minimum: 2 }
end  

#validates date
class Course < ActiveRecord::Base
  validate :valid_dates
  def valid_dates
    if start_date >= end_date
      self.errors.add :end_date, ' has to be after start date'
    end
  end
end  
