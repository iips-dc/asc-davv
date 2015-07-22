class AddColumnToPrincipalWorkshop < ActiveRecord::Migration
  def change
    add_column :principal_workshops, :dob, :date
  end
end
