require 'rails_helper'

describe SearchController, type: :request  do
  let(:filter) { '' }
  let(:text) { '' }
  let(:params) do
    {
      filter: filter,
      text: text
    }
  end
  let(:model0) { VehicleModel.find_by(name: 'JETTA') }
  let(:model) { model0 }
  let(:model2) { model0 }
  let(:year) { '2020' }
  let(:year2) { '2020' }
  let(:mileage) { '10000' }
  let(:mileage2) { '10000' }
  let(:price) { 10_000 }
  let(:price2) { 10_000 }

  before :each do
    Vehicle.create(
      year: '2020',
      mileage: '10000',
      price: 10_000,
      model: model0
    )
    Vehicle.create(
      year: year,
      mileage: mileage,
      price: price,
      model: model
    )
    Vehicle.create(
      year: year2,
      mileage: mileage2,
      price: price2,
      model: model2
    )
  end

  context 'search by model name' do
    let(:model) { VehicleModel.find_by(name: 'GOLF') }
    let(:model2) { VehicleModel.find_by(name: 'GOLFII') }
    let(:filter) { 'model_name' }

    context 'start with value' do
      let(:text) { 'GOLF' }

      it 'should return 2 items' do
        get '/search/', params: params
        expect(response.status).to eq 200
        expect(JSON.parse(response.body).count).to eq 2
      end
    end
  end

  context 'search by brand name' do
    let(:model) { VehicleBrand.find_by(name: 'VW').models.first }
    let(:model2) { VehicleBrand.find_by(name: 'VWW').models.first }
    let(:filter) { 'brand_name' }

    context 'start with value' do
      let(:text) { 'VW' }

      it 'should return 2 items' do
        get '/search/', params: params
        expect(response.status).to eq 200
        expect(JSON.parse(response.body).count).to eq 2
      end
    end
  end

  context 'search by year' do
    let(:year) { '2022' }
    let(:year2) { '2021' }
    let(:filter) { 'year' }

    context 'greather than value' do
      let(:text) { '2020' }

      it 'should return 2 items' do
        get '/search/', params: params
        expect(response.status).to eq 200
        expect(JSON.parse(response.body).count).to eq 2
      end
    end
  end

  context 'search by mileage' do
    let(:mileage) { '5000' }
    let(:mileage2) { '5400' }
    let(:filter) { 'mileage' }

    context 'lower than value' do
      let(:text) { '6000' }

      it 'should return 2 items' do
        get '/search/', params: params
        expect(response.status).to eq 200
        expect(JSON.parse(response.body).count).to eq 2
      end
    end
  end

  context 'search by price' do
    let(:price) { '2000' }
    let(:price2) { '2400' }
    let(:filter) { 'price' }
    context 'lower than value' do
      let(:text) { '5000' }

      it 'should return 2 items' do
        get '/search/', params: params
        expect(response.status).to eq 200
        expect(JSON.parse(response.body).count).to eq 2
      end
    end
  end
end
