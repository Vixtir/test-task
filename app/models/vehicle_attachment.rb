class VehicleAttachment < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	belongs_to :vehicle
end
