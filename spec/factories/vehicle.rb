FactoryGirl.define do
  factory :vehicle, class: Vehicle do
  	name "Shevrolet"
  	gos_num "X777XX 77"
  	pts "17 РВ 123412"
  	pts_date { 1.years.ago }
  end
end