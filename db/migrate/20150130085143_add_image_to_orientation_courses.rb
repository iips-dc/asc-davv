class AddImageToOrientationCourses < ActiveRecord::Migration
  def change
    add_column :orientation_courses, :image, :string
    add_column :interaction_programs, :image, :string
  end
end
