class CreateVehicleModels
  attr_reader :errors, :model

  def initialize
    @errors = []
  end

  def call(model_name:, brand_name:)
    ActiveRecord::Base.transaction do
      @brand_name = brand_name
      create_brand! if brand.blank?

      @model = VehicleModel.new(
        name: model_name, brand: brand)
      model.save!
    end
  rescue => e
    @errors << e.message
  end

  def valid?
    errors.empty?
  end

  private

  def create_brand!
    brand = VehicleBrand.new(name: @brand_name)
    brand.save!
  end

  def brand
    @brand ||= VehicleBrand.find_by(name: @brand_name)
  end
end
