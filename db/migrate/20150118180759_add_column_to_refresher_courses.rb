class AddColumnToRefresherCourses < ActiveRecord::Migration
  def change
    add_column :refresher_courses, :alternate_email, :string
  end
end
