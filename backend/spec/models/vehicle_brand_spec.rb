# == Schema Information
#
# Table name: vehicle_brands
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe VehicleBrand, type: :model do
  context 'attributes' do
    it 'should respond to name' do
      expect(subject.name).to eq nil
    end
  end

  context 'associations' do
    it 'has many vehicle models' do
      expect(subject.models).to eq []
    end
  end
end
