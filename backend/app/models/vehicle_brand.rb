# == Schema Information
#
# Table name: vehicle_brands
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class VehicleBrand < ApplicationRecord

  has_many :models, class_name: 'VehicleModel', foreign_key: :brand_id
  validates_uniqueness_of :name
end
