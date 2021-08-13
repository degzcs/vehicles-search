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
require 'rails_helper'

RSpec.describe VehicleModel, type: :model do
  context 'attributes' do
    it 'should respond to name' do
      expect(subject.name).to eq nil
    end
  end

  context 'associtions' do
    it 'belongs to vehicle models' do
      expect(subject.brand).to eq nil
    end
    it 'has many vehicle' do
      expect(subject.vehicles).to eq []
    end
  end
end
