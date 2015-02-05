class ResourcePerson < ActiveRecord::Base
  attr_accessible :email, :mobile, :person_name
end

#field not remain blank
class  Course < ActiveRecord::Base
  validates :email, :mobile, :person_name, presence: true
end

#field can contain only alphabets and space
class Course < ActiveRecord::Base
  validates :person_name, format: { with: /\A[a-zA-Z\s.,\d]+\z/,
    message: "only alphabets and spaces are allowed" }
end