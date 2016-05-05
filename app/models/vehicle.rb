class Vehicle < ActiveRecord::Base
	mount_uploaders :images, ImageUploader
end
