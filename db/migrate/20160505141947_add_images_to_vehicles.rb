class AddImagesToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :images, :json
  end
end
