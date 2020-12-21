class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :title
      t.string :status
      t.integer :user_recived_id

      t.timestamps
    end
  end
end
