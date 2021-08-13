# == Schema Information
#
# Table name: vehicle_models
#
#  id         :integer          not null, primary key
#  brand_id   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class VehicleModel < ApplicationRecord

  belongs_to :brand, class_name: 'VehicleBrand', foreign_key: :brand_id
  has_many :vehicles, class_name: 'Vehicle'

  validates_uniqueness_of :name
  validates_presence_of :name

  scope :retrieve_by , -> (model_name, brand_name) do
    joins(:brand).where(name: model_name, vehicle_brands: { name: brand_name })
  end
end
