class ShorttermCourse < ActiveRecord::Base
  attr_accessible :category, :city, :college, :course, :date_of_joining, :district, :dob, :email, :gender, :landline, :marital_status, :mobile, :name, :payscale, :phd, :pin, :position, :pref_date1, :pref_date2, :religion, :res_address, :state, :stream, :university, :university_pin
end

#field not remain blank
class  ShorttermCourse < ActiveRecord::Base
  validates :name, :gender, :dob, :religion,:category, :marital_status,:stream,
  :college,:university,:city,:district,:state,
  :position,:payscale,:course,:pin,:university_pin,:date_of_joining,:pref_date1,:pref_date2,:res_address,:phd, :email, presence: true
end

#field must contain alphabets
class ShorttermCourse < ActiveRecord::Base
  validates :name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
end

#following fiels must contain integer
class ShorttermCourse < ActiveRecord::Base
  validates :pin,:university_pin, numericality: true
  validates :landline,:mobile, numericality: { only_integer: true }
end

#fields must be unique
class  ShorttermCourse < ActiveRecord::Base
  validates :email,:mobile, uniqueness: true
end

#length of the fields
class ShorttermCourse < ActiveRecord::Base
  validates :name, length: { minimum: 2 }
  validates :pin, length: { is: 6 ,message: "must be of 6 digits"}
  
  validates :university_pin, length: { is: 6 ,message: "must be of 6 digits"}
  
  
  validates :mobile, length: { is: 10,message: "must be of 10 digits" }
end