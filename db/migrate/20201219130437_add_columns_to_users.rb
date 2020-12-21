class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :user_code, :string
    add_column :users, :role, :string, default: "user"
  end
end
