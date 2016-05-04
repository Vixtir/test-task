class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :gos_num
      t.string :pts
      t.date :pts_date

      t.timestamps null: false
    end
  end
end
