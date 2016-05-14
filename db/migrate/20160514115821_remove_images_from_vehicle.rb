class RemoveImagesFromVehicle < ActiveRecord::Migration
  def change
    remove_column :vehicles, :image, :string
    remove_column :vehicles, :images, :json
  end
end
