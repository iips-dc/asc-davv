class CreateResourcePeople < ActiveRecord::Migration
  def change
    create_table :resource_people do |t|
      t.string :person_name
      t.string :email
      t.string :mobile

      t.timestamps
    end
  end
end
