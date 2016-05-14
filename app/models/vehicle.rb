class Vehicle < ActiveRecord::Base
  before_save :upcase

  has_many :vehicle_attachments, dependent: :destroy
  accepts_nested_attributes_for :vehicle_attachments, 
                                allow_destroy: true

  validates :name,
            :gos_num,
            :pts,
            :pts_date,
            presence: true
  validates :name, length: {
    minimum: 3,
    maximum: 20,
    too_short: "Минимальное количество символов %{count}",
    too_long: "Максимальное количество символов %{count}"
    }
  validates :gos_num, :pts, uniqueness: true

  validates_format_of :gos_num, with: /\A[a-zA-Z]{1}\d{3}[a-zA-Z]{2}\s{1}\d{2,3}\z/i
  validates_format_of :pts, with: /\A\d{2}\s{1}[a-zA-Z]{2}\s\d{6}/i

  def upcase
    self.gos_num = gos_num.upcase
    self.pts = pts.upcase
  end
end
