class ShorttermCourse < ActiveRecord::Base
  belongs_to :course
  attr_accessible :category, :city, :college, :subject, :date_of_joining, :district, :dob, :email, :gender, :landline, :marital_status, :mobile, :name, :payscale, :phd, :pin, :position, :pref_date1, :pref_date2, :religion, :res_address, :state, :stream, :university, :university_pin, :std_code, :alternate_email, :image, :image_cache, :dd_number, :dd_date, :bank_name, :amount, :course_id
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
  validates :mobile, numericality: { only_integer: true }
  validates :landline, :std_code, numericality: { only_integer: true }, :allow_blank => true
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

  validates :dd_number, length: { is: 6,message: "must be of 6 digits" }, :allow_blank => true
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

# searching and sorting
class ShorttermCourse < ActiveRecord::Base
    filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
        :sorted_by, 
        :search_query,
        :with_course_name
        ]
    )

    scope :search_query, lambda { |query|
      return nil if query.blank?

      # condition query, parse into individual keywords
      terms = query.to_s.downcase.split(/\s+/)

      # replace "*" with "%" for wildcard searches,
      # append '%', remove duplicate '%'s
      terms = terms.map { |e|
        ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')
      }

      # configure number of OR conditions for provision
      # of interpolation arguments. Adjust this if you
      # change the number of OR conditions.
      num_or_conditions = 3
      where(
        terms.map {
          or_clauses = [
            "LOWER(shortterm_courses.name) LIKE ?",
            "LOWER(shortterm_courses.email) LIKE ?",
            "shortterm_courses.mobile LIKE ?"
          ].join(' OR ')
          "(#{ or_clauses })"
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conditions }.flatten
      )
    }

    scope :sorted_by, lambda { |sort_option|
      # extract the sort direction from the param value.
      direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
      case sort_option.to_s
      when /^created_at_/
        # Simple sort on the created_at column.
        # Make sure to include the table name to avoid ambiguous column names.
        # Joining on other tables is quite common in Filterrific, and almost
        # every ActiveRecord table has a 'created_at' column.
        order("shortterm_courses.created_at #{ direction }")
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
      end
    }

    def self.options_for_sorted_by
      [
        ['Registration date (newest first)', 'created_at_desc'],
        ['Registration date (oldest first)', 'created_at_asc']
      ]
    end


    scope :with_course_name, lambda { |course_name|
      where('courses.course_name = ?', course_name).joins(:course)
    }
end    