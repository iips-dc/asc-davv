class ResourcePerson < ActiveRecord::Base
  has_many :courses	
  attr_accessible :mobile, :person_email, :person_name
end

#field not remain blank
class  ResourcePerson < ActiveRecord::Base
  validates :mobile, :person_email, :person_name, presence: true
end

#field can contain only alphabets and space
class ResourcePerson < ActiveRecord::Base
  validates :person_name, format: { with: /\A[a-zA-Z\s.,\d]+\z/,
    message: "only alphabets and spaces are allowed" }
end

#length of the fields
class ResourcePerson < ActiveRecord::Base
	validates :mobile, length: { is: 10,message: "must be of 10 digits" }
end