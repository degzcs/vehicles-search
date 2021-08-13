# == Schema Information
#
# Table name: vehicles
#
#  id         :integer          not null, primary key
#  model_id   :integer
#  year       :string
#  mileage    :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  context 'attributes' do
    it 'should respond to year' do
      expect(subject.year).to eq nil
    end
    it 'should respond to mileage' do
      expect(subject.mileage).to eq nil
    end
    it 'should respond to price' do
      expect(subject.price).to eq nil
    end
  end

  context 'associations' do
    it 'belongs to vehicle model' do
      expect(subject.model).to eq nil
    end
  end
end
