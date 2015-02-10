class AddStdCodeToInteractionPrograms < ActiveRecord::Migration
  def change
    add_column :interaction_programs, :std_code, :string
  end
end
