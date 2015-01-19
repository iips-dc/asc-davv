class OrientationCourse < ActiveRecord::Base
  attr_accessible :category, :city, :college, :course, :date_of_joining, :district, :dob, :email, :gender, :landline, :marital_status, :mobile, :name, :payscale, :phd, :pin, :position, :pref_date1, :pref_date2, :religion, :res_address, :state, :stream, :university, :university_pin, :std_code, :alternate_email
end

#field not remain blank
class  OrientationCourse < ActiveRecord::Base
  validates :name, :gender, :dob, :religion,:category, :marital_status,:stream,
  :college,:university,:city,:district,:state,
  :position,:payscale,:course,:pin,:university_pin,:date_of_joining,:pref_date1,:pref_date2,:res_address, :email, presence: true
end

#field must contain alphabets
class OrientationCourse < ActiveRecord::Base
  validates :name, :city, :college, :district, :stream, :university, :course, format: { with: /\A[a-zA-Z\s]+\z/,
    message: "only alphabets and spaces are allowed" }
end

#following fiels must contain integer
class OrientationCourse < ActiveRecord::Base
  validates :pin,:university_pin, numericality: true
  validates :landline,:mobile, :std_code, numericality: { only_integer: true }
end

#Combination of fields that must be unique
class OrientationCourse < ActiveRecord::Base
  validates_uniqueness_of :name, scope: [:pref_date1, :pref_date2, :dob]
end

#length of the fields
class OrientationCourse < ActiveRecord::Base
  validates :name, length: { minimum: 2 }
  validates :pin, length: { is: 6 ,message: "must be of 6 digits"}
  
  validates :university_pin, length: { is: 6 ,message: "must be of 6 digits"}
  
  validates :mobile, length: { is: 10,message: "must be of 10 digits" }
end