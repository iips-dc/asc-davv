class CreateWinterSchools < ActiveRecord::Migration
  def change
    create_table :winter_schools do |t|
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
      t.string :position
      t.string :payscale
      t.string :subject
      t.string :pin
      t.string :landline
      t.string :mobile
      t.string :university_pin
      t.date :dob
      t.date :date_of_joining
      t.date :pref_date1
      t.date :pref_date2
      t.text :res_address
      t.boolean :phd
      t.string :std_code
      t.string :alternate_email

      t.timestamps
    end
  end
end
