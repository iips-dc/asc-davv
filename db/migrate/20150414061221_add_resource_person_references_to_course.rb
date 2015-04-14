class AddResourcePersonReferencesToCourse < ActiveRecord::Migration
  def change
  	add_column :courses, :resource_person_id, :integer
    add_index :courses, :resource_person_id
  end
end
