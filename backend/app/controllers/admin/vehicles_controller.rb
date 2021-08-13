module Admin
  class VehiclesController < ApplicationController

    def create
      service = CreateVehicles.new
      service.call(
        vehicle_attrs: {
          year: vehicle_params[:year],
          price: vehicle_params[:price],
          mileage: vehicle_params[:mileage]
        },
        brand_name: vehicle_params[:brand],
        model_name: vehicle_params[:model]
      )

      if service.valid?
        render json: service.vehicle.to_json, status: 201
      else
        render json: { error: service.errors.first }, status: 409
      end
    end

    def vehicle_params
      params.permit(:mileage, :year, :brand, :model, :price)
    end
  end
end
