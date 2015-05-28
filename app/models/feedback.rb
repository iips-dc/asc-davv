class Feedback < ActiveRecord::Base
  belongs_to :resource_person
  belongs_to :course
  attr_accessible :communication_skill, :competency_subject, :quality_lecture, :usefulness_topic, :resource_person_id, :course_id

  #field not remain blank
  validates :communication_skill, :competency_subject, :quality_lecture, :usefulness_topic, :resource_person_id, :course_id, presence: true

  # searching and sorting
    filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
        :sorted_by
        ]
    )

    scope :sorted_by, lambda { |sort_option|
      # extract the sort direction from the param value.
      direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
      case sort_option.to_s
      when /^created_at_/
        # Simple sort on the created_at column.
        # Make sure to include the table name to avoid ambiguous column names.
        # Joining on other tables is quite common in Filterrific, and almost
        # every ActiveRecord table has a 'created_at' column.
        order("feedbacks.created_at #{ direction }")
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