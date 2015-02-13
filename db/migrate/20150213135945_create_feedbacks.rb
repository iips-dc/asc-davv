class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :communication_skill
      t.integer :usefulness_topic
      t.integer :competency_subject
      t.integer :quality_lecture
      t.references :resource_person

      t.timestamps
    end
    add_index :feedbacks, :resource_person_id
  end
end
