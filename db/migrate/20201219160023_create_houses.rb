class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :image
      t.string :pice
      t.integer :acreage
      t.string :kind
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :gara_size
      t.boolean :is_wc
      t.boolean :is_wf
      t.boolean :is_cook
      t.boolean :is_elevator
      t.boolean :is_time_free
      t.boolean :is_pet
      t.boolean :is_aircon
      t.boolean :is_rent
      t.string :video_url
      t.integer :user_id
      t.string :city

      t.timestamps
    end
  end
end
