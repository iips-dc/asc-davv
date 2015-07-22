class CreatePrincipalWorkshops < ActiveRecord::Migration
  def change
    create_table :principal_workshops do |t|
      t.string :name
      t.string :designation
      t.string :university
      t.string :univ_type
      t.string :academic_qualification
      t.text :office_address
      t.text :res_address
      t.string :std_code
      t.string :office_number
      t.string :mobile
      t.string :fax_code
      t.string :fax_number
      t.string :email
      t.references :course

      t.timestamps
    end
    add_index :principal_workshops, :course_id
  end
end
