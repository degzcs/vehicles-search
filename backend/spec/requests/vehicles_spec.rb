require 'rails_helper'

describe  Admin::VehiclesController, type: :request do
  let(:brand) { 'VW' }
  let(:model) { 'GOLF' }
  let(:year){ '2020' }
  let(:price) { 10_000 }
  let(:mileage) { 50_000 }
  let(:params) do
    {
      brand: brand,
      model: model,
      year: year,
      price: price,
      mileage: mileage
    }
  end

  context 'happy path' do
    let(:vehicle) do
      Vehicle.find_by( year: year, price: price, mileage: mileage)
    end

    let!(:rmodel) do
      rbrand = VehicleBrand.find_by(name: brand)
      VehicleModel.create(name: model, brand: rbrand)
    end

    it 'should create a vehicle' do
      post '/admin/vehicles', params: params
      expect(response.status).to eq 201
      expect(vehicle).not_to be_nil
      expect(vehicle.model.name).to eq rmodel.name
    end
  end

  context 'errors' do
    context 'missing field' do
      let(:year){ nil }

      it 'returns an error' do
        post '/admin/vehicles', params: params
        expect(response.status).to eq 409
      end
    end
  end
end
