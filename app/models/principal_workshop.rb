class PrincipalWorkshop < ActiveRecord::Base
  belongs_to :course
  attr_accessible :academic_qualification, :designation, :dob, :email, :fax_code, :fax_number, :mobile, :name, :office_address, :office_number, :res_address, :std_code, :univ_type, :university, :dd_number, :dd_date, :bank_name, :amount, :course_id

  #field not remain blank
  validates :name, :dob, :designation, :university, :univ_type, :academic_qualification, :email, 
  :std_code, :office_number, :mobile, :office_address, 
  :res_address, :course_id, presence: true

  #field must contain alphabets and space
  validates :name, :university, format: { with: /\A[a-zA-Z\s.,]+\z/,
    message: "only alphabets and spaces are allowed" }

  #Combination of fields that must be unique
  validates_uniqueness_of :name, scope: [:email], message: "Record Already Exist"

  #following fields must contain integer
  validates :mobile, numericality: { only_integer: true }
  validates :office_number, :std_code, numericality: { only_integer: true }
  validates :fax_number, :fax_code, numericality: { only_integer: true }, :allow_blank => true

  #length of the fields
  validates :name, length: { minimum: 2 }
  validates :mobile, length: { is: 10,message: "must be of 10 digits" }

  validates :dd_number, length: { is: 6,message: "must be of 6 digits" }, :allow_blank => true

  #searching and sorting
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
            "LOWER(principal_workshops.name) LIKE ?",
            "LOWER(principal_workshops.email) LIKE ?",
            "principal_workshops.mobile LIKE ?"
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
        order("principal_workshops.created_at #{ direction }")
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

    acts_as_xlsx
    
end
