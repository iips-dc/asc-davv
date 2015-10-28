class AddCourseReferenceToWinterSchool < ActiveRecord::Migration
  def change
  	add_column :winter_schools, :course_id, :integer
    add_index :winter_schools, :course_id
  end
end
