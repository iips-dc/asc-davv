class CreateResourcePeople < ActiveRecord::Migration
  def change
    create_table :resource_people do |t|
      t.string :person_name
      t.string :mobile
      t.string :person_email

      t.timestamps
    end
  end
end
