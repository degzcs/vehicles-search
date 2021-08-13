class CreateVehicles
  attr_reader :errors, :vehicle

  def initialize
    @errors = []
  end

  def call(vehicle_attrs:, brand_name:, model_name:)
    model = find_model_by(brand_name, model_name)
    @vehicle = Vehicle.new(vehicle_attrs.merge(model: model))
    vehicle.save!
  rescue => e
    @errors << e.message
  end

  def valid?
    @errors.empty?
  end

  private

  def find_model_by(brand_name, model_name)
    VehicleModel.retrieve_by(model_name.upcase, brand_name).first
  end
end
