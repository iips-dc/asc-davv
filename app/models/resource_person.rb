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

# searching and sorting
class ResourcePerson < ActiveRecord::Base
    filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
        :sorted_by, 
        :search_query
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
            "LOWER(resource_people.person_name) LIKE ?",
            "LOWER(resource_people.person_email) LIKE ?",
            "resource_people.mobile LIKE ?"
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
        order("resource_people.created_at #{ direction }")
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
end 