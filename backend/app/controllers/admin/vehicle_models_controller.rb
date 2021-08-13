module Admin
  class VehicleModelsController < ApplicationController

    def create
      service = CreateVehicleModels.new
      service.call(model_name: model_params[:name],
                   brand_name: brand_params[:brand])

      if service.valid?
        render json: service.model.to_json, status: 201
      else
        render json: { error: service.errors.first }, status: 409
      end
    end

    private

    def model_params
      params.permit(:name)
    end

    def brand_params
      params.permit(:brand)
    end
  end
end
