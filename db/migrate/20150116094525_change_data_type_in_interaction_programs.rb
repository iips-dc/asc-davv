class ChangeDataTypeInInteractionPrograms < ActiveRecord::Migration
  def up
    change_column :interaction_programs, :research_experience, :string
  end

  def down
    change_column :interaction_programs, :research_experience, :integer
  end
end
