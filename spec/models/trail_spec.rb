require 'rails_helper'

describe Trail, type: :model do
  context 'relationships' do
    it {should have_many(:trip_trails)}
    it {should have_many(:trips)}
  end

  context 'instance methods' do
    it '.trip_count' do
      trail = Trail.create(name: 'Mt Elbert', address: 'Colorado', length: 11)
      trip_1 = trail.trips.create(name: 'v fun adventure')
      trip_2 = trail.trips.create(name: 'v v fun adventure')

      expect(trail.trip_count).to eq(2)
    end
  end
end
