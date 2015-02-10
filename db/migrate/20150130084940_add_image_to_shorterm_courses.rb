class AddImageToShortermCourses < ActiveRecord::Migration
  def change
    add_column :shortterm_courses, :image, :string
  end
end
