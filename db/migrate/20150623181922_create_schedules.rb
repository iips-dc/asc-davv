class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :attachment
      t.string :description

      t.timestamps
    end
  end
end
