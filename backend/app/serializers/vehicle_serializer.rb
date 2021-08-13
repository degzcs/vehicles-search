class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :year, :mileage, :price, :brand_name, :model_name

  def brand_name
    object&.model&.brand&.name
  end

  def model_name
    object&.model&.name
  end
end
