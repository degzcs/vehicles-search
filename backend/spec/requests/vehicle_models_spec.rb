require 'rails_helper'

describe Admin::VehicleModelsController, type: :request do
  let(:name) { 'PR' }
  let(:brand) { 'VW' }
  let(:params) do
    {
      name: name,
      brand: brand
    }
  end

  context 'happy path' do
    it 'should create a new vehicle model' do
      post '/admin/vehicle_models', params: params
      expect(response.status).to eq 201
      expect(VehicleModel.find_by(name: name)).not_to be_nil
    end
  end

  context 'New brand' do
    let(:brand) { 'THE-B' }

    it 'should create a new vehicle model and brand' do
      post '/admin/vehicle_models', params: params
      expect(response.status).to eq 201
      expect(VehicleModel.find_by(name: name)).not_to be_nil
      expect(VehicleBrand.find_by(name: brand)).not_to be_nil
    end
  end

  context 'errors' do
    context 'missing field' do
      let(:name) { nil }

      it 'returns an error' do
        post '/admin/vehicle_models', params: params
        expect(response.status).to eq 409
        expect(VehicleModel.find_by(name: name)).to be_nil
      end
    end

    context 'duplicated name' do
      let(:name) { 'RT' }

      before :each do
        rbrand = VehicleBrand.find_by(name: brand)
        VehicleModel.create(name: name, brand: rbrand)
      end

      it 'returns an error' do
        post '/admin/vehicle_models', params: params
        expect(response.status).to eq 409
        expect(VehicleModel.where(name: name).count).to eq 1
      end
    end
  end
end
