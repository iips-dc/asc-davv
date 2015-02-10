class AddStdCodeToOrientationCourses < ActiveRecord::Migration
  def change
    add_column :orientation_courses, :std_code, :string
  end
end
