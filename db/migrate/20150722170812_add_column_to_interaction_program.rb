class AddColumnToInteractionProgram < ActiveRecord::Migration
  def change
    add_column :interaction_programs, :dob, :date
  end
end
