class Vehicle < ActiveRecord::Base
	# mount_uploaders :images, ImageUploader
	has_many :vehicle_attachments
	accepts_nested_attributes_for :vehicle_attachments

	validates :name,
            :gos_num,
            :pts,
            :pts_date,
            presence: true
	validates :gos_num, :pts, uniqueness: true    
end
