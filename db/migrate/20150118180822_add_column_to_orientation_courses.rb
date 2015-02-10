class AddColumnToOrientationCourses < ActiveRecord::Migration
  def change
    add_column :orientation_courses, :alternate_email, :string
  end
end
