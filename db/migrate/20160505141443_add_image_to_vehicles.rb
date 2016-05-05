class AddImageToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :image, :string
  end
end
