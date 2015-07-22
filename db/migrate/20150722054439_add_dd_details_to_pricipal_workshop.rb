class AddDdDetailsToPricipalWorkshop < ActiveRecord::Migration
  def change
    add_column :principal_workshops, :dd_number, :string
    add_column :principal_workshops, :dd_date, :date
    add_column :principal_workshops, :bank_name, :string
    add_column :principal_workshops, :amount, :integer
  end
end
