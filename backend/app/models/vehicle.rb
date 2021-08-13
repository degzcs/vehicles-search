# == Schema Information
#
# Table name: vehicles
#
#  id         :integer          not null, primary key
#  model_id   :integer
#  year       :string
#  mileage    :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Vehicle < ApplicationRecord

  belongs_to :model, class_name: 'VehicleModel', foreign_key: :model_id
  has_one :brand, through: :model, class_name: 'VehicleBrand'
  validates_presence_of :year, :mileage, :price

  scope :by_model_name, -> (model_name) { joins(:model).where("vehicle_models.name LIKE '%#{model_name.upcase}%'") }
  scope :by_brand_name, -> (brand_name) { joins(model: :brand).where("vehicle_brands.name LIKE '%#{brand_name.upcase}%'") }
  scope :greater_than_year, -> (value) { where('year > ?', value) }
  scope :lower_than_mileage, -> (value) { where('CAST(mileage as int) < ?', value) } # TODO migrate to integer
  scope :lower_than_price, -> (value) { where('price < ?', value) }
end
