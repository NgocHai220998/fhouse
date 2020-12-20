class CreateHousePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :house_photos do |t|
      t.integer :house_id
      t.string :photo

      t.timestamps
    end
  end
end
