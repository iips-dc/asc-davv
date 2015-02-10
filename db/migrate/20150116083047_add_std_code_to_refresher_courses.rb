class AddStdCodeToRefresherCourses < ActiveRecord::Migration
  def change
    add_column :refresher_courses, :std_code, :string
  end
end
