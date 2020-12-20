class CreateCares < ActiveRecord::Migration[6.1]
  def change
    create_table :cares do |t|
      t.integer :house_id
      t.integer :user_id

      t.timestamps
    end
  end
end
