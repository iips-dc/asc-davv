class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :shortterm_courses, :program_course, :subject
  	rename_column :refresher_courses, :program_course, :subject
  	rename_column :orientation_courses, :program_course, :subject
  end

  def down
  end
end
