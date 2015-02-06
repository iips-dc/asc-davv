class InteractionProgram < ActiveRecord::Base
  belongs_to :course
  attr_accessible :category, :city, :college, :date_of_joining_phd, :district, :email, :gender, :landline, :marital_status, :mobile, :name, :pin, :religion, :res_address, :research_experience, :state, :stream, :university, :university_pin, :std_code, :image, :course_id
  mount_uploader :image, ImageUploader
end

#field not remain blank
class  InteractionProgram < ActiveRecord::Base
  validates :name, :gender, :religion,:category, :marital_status,:stream,
  :college,:university,:city,:district,:state, :research_experience,
  :pin,:university_pin,:date_of_joining_phd, :res_address, :email, :course_id, :image, presence: true
end

#field must contain alphabets and space
class InteractionProgram < ActiveRecord::Base
  validates :name, :city, :college, :district, :stream, :university, format: { with: /\A[a-zA-Z\s.,]+\z/,
    message: "only alphabets and spaces are allowed" }
end

#following fiels must contain integer
class InteractionProgram < ActiveRecord::Base
  validates :pin,:university_pin, numericality: true
  validates :landline,:mobile, :std_code, numericality: { only_integer: true }
end

#length of the fields
class InteractionProgram < ActiveRecord::Base
  validates :name, length: { minimum: 2 }
  validates :pin, length: { is: 6 ,message: "must be of 6 digits"}
  
  validates :university_pin, length: { is: 6 ,message: "must be of 6 digits"}
  
  
  validates :mobile, length: { is: 10,message: "must be of 10 digits" }
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