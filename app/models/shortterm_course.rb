class ShorttermCourse < ActiveRecord::Base
  belongs_to :course
  attr_accessible :category, :city, :college, :subject, :date_of_joining, :district, :dob, :email, :gender, :landline, :marital_status, :mobile, :name, :payscale, :phd, :pin, :position, :pref_date1, :pref_date2, :religion, :res_address, :state, :stream, :university, :university_pin, :std_code, :alternate_email, :image, :course_id
  mount_uploader :image, ImageUploader
end

#field not remain blank
class  ShorttermCourse < ActiveRecord::Base
  validates :name, :gender, :dob, :religion,:category, :marital_status,:stream,
  :college,:university,:city,:district,:state,:position,:payscale,:subject,:pin,:university_pin,:date_of_joining,:pref_date1,:pref_date2,:res_address, :email, :image, :course_id, presence: true
end

#field must contain alphabets
class ShorttermCourse < ActiveRecord::Base
  validates :name, :city, :college, :district, :stream, :university, :subject, format: { with: /\A[a-zA-Z\s.,]+\z/,
    message: "only alphabets and spaces are allowed" }
end

#following fields must contain integer
class ShorttermCourse < ActiveRecord::Base
  validates :pin,:university_pin, numericality: true
  validates :landline, :std_code, :mobile, numericality: { only_integer: true }
end

#Combination of fields that must be unique
class ShorttermCourse < ActiveRecord::Base
  validates_uniqueness_of :name, scope: [:pref_date1, :dob]
end

#length of the fields
class ShorttermCourse < ActiveRecord::Base
  validates :name, length: { minimum: 2 }
  validates :pin, length: { is: 6 ,message: "must be of 6 digits"}
  
  validates :university_pin, length: { is: 6 ,message: "must be of 6 digits"}
   
  validates :mobile, length: { is: 10,message: "must be of 10 digits" }
end

#validates date
class ShorttermCourse < ActiveRecord::Base
  validate :valid_dates
  def valid_dates
    if pref_date1 >= pref_date2
      self.errors.add :pref_date2, ' has to be after preferred date1'
    end
  end
end 

#size of the image
class ShorttermCourse < ActiveRecord::Base
    validate :image_size_validation, :if => "image?"

    def image_size_validation
        if image.size > 1.megabytes
          errors.add(:base, "Image should be less than 1MB")
        end
    end
end

