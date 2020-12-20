class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :house_id
      t.integer :star
      t.string :content

      t.timestamps
    end
  end
end
