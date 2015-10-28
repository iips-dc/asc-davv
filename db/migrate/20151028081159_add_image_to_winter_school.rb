class AddImageToWinterSchool < ActiveRecord::Migration
  def change
    add_column :winter_schools, :image, :string
  end
end
