class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.string :body
      t.date :end_date

      t.timestamps
    end
  end
end
