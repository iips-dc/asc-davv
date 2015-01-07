class Course < ActiveRecord::Base
  attr_accessible :course_name, :description, :end_date, :start_date, :type
end
