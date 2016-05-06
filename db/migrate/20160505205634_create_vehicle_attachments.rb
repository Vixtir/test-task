class CreateVehicleAttachments < ActiveRecord::Migration
  def change
    create_table :vehicle_attachments do |t|
      t.integer :vehicle_id
      t.string :image

      t.timestamps null: false
    end
  end
end
