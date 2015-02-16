class AddCourseReferencesToFeedback < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :course_id, :integer
    add_index :feedbacks, :course_id
  end
end
