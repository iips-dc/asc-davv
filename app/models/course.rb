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
  validates :course_name, :description, :end_date, :start_date, :course_type, :session, presence: true
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

# searching and sorting
class Course < ActiveRecord::Base
    filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
        :sorted_by, 
        :search_query,
        :with_session
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
      num_or_conditions = 2
      where(
        terms.map {
          or_clauses = [
            "LOWER(courses.course_name) LIKE ?",
            "LOWER(courses.course_type) LIKE ?"
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
        order("courses.created_at #{ direction }")
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
      end
    }

    def self.options_for_sorted_by
      [
        ['Newest first', 'created_at_desc'],
        ['Oldest first', 'created_at_asc']
      ]
    end


    scope :with_session, lambda { |session|
      where(session: [*session])
    }

end 
