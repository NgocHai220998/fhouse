class AddViewsToHouses < ActiveRecord::Migration[6.1]
  def change
    add_column :houses, :view, :integer
  end
end
