class AddRefrences < ActiveRecord::Migration
  def up
  	add_column :shortterm_courses, :course_id, :integer
    add_index :shortterm_courses, :course_id
  
    add_column :refresher_courses, :course_id, :integer
    add_index :refresher_courses, :course_id

    add_column :orientation_courses, :course_id, :integer
    add_index :orientation_courses, :course_id

    add_column :interaction_programs, :course_id, :integer
    add_index :interaction_programs, :course_id
  end

  def down
  end
end
