class FixColumn < ActiveRecord::Migration
  def up
  	rename_column :refresher_courses, :course, :program_course
  	rename_column :orientation_courses, :course, :program_course
  end

  def down
  end
end
