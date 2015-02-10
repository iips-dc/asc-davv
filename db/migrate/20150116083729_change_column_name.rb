class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :orientation_courses, :university_pi, :university_pin
  end

end
