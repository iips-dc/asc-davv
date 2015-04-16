class AddSessionToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :session, :string
  end
end
