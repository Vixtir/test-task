class Vehicle < ActiveRecord::Base
  has_many :vehicle_attachments
  accepts_nested_attributes_for :vehicle_attachments

  validates :name,
            :gos_num,
            :pts,
            :pts_date,
            presence: true
  validates :gos_num, :pts, uniqueness: true

  validates_format_of :gos_num, with: /\A[a-z]{1}\d{3}[a-z]{2}\s{1}\d{2}\z/i
  validates_format_of :gos_num, with: /\A\d{2}\s{1}[a-zA-Z]{2}\s\d{6}/i
end
