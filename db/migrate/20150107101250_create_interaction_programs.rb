class CreateInteractionPrograms < ActiveRecord::Migration
  def change
    create_table :interaction_programs do |t|
      t.string :name
      t.string :gender
      t.string :religion
      t.string :category
      t.string :marital_status
      t.string :email
      t.string :stream
      t.string :college
      t.string :university
      t.string :city
      t.string :district
      t.string :state
      t.string :landline
      t.string :mobile
      t.string :university_pin
      t.text :res_address
      t.string :pin
      t.date :date_of_joining_phd
      t.integer :research_experience

      t.timestamps
    end
  end
end
