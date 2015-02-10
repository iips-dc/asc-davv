class AddStdCodeToShorttermCourses < ActiveRecord::Migration
  def change
    add_column :shortterm_courses, :std_code, :string
  end
end
