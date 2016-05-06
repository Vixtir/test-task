class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :description
      t.string :image
      t.integer :vehicle_id

      t.timestamps null: false
    end
  end
end
