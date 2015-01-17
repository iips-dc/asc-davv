class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :courses, :type, :course_type 
  end

  def down
  end
end
