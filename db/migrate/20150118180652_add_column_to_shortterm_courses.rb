class AddColumnToShorttermCourses < ActiveRecord::Migration
  def change
    add_column :shortterm_courses, :alternate_email, :string
  end
end
