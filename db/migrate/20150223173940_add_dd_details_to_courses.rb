class AddDdDetailsToCourses < ActiveRecord::Migration
  def change
  	add_column :shortterm_courses, :dd_number, :string
  	add_column :shortterm_courses, :dd_date, :date
  	add_column :shortterm_courses, :bank_name, :string
  	add_column :shortterm_courses, :amount, :integer

  	add_column :refresher_courses, :dd_number, :string
  	add_column :refresher_courses, :dd_date, :date
  	add_column :refresher_courses, :bank_name, :string
  	add_column :refresher_courses, :amount, :integer 
  
  	add_column :orientation_courses, :dd_number, :string
  	add_column :orientation_courses, :dd_date, :date
  	add_column :orientation_courses, :bank_name, :string
  	add_column :orientation_courses, :amount, :integer

  	add_column :interaction_programs, :dd_number, :string
  	add_column :interaction_programs, :dd_date, :date
  	add_column :interaction_programs, :bank_name, :string
  	add_column :interaction_programs, :amount, :integer
  end
end
