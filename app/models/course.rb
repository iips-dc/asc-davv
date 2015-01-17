class Course < ActiveRecord::Base
  attr_accessible :course_name, :description, :end_date, :start_date, :course_type
end

#field not remain blank
class  Course < ActiveRecord::Base
  validates :course_name, :description, :end_date, :start_date, :course_type, presence: true
end

#field can contain only alphabets and space
class Course < ActiveRecord::Base
  validates :course_name, :description, :course_type, format: { with: /\A[a-zA-Z\s]+\z/,
    message: "only alphabets and spaces are allowed" }
end


#length of the fields
class Course < ActiveRecord::Base
  validates :course_name, :description, :course_type, length: { minimum: 2 }
end  