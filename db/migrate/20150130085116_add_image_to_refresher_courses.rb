class AddImageToRefresherCourses < ActiveRecord::Migration
  def change
    add_column :refresher_courses, :image, :string
  end
end
