require 'rails_helper'

describe Trip, type: :model do
  context 'relationships' do
    it {should have_many(:trip_trails)}
    it {should have_many(:trails)}
  end
  context 'instance methods' do
    it '.total_distance' do
      trip = Trip.create(name: 'Fun trip')
      trail_1 = trip.trails.create(name: 'Old Rag', address: 'Virginia', length: 9)
      trail_2 = trip.trails.create(name: 'Mt Elbert', address: 'Colorado', length: 11)

      expect(trip.total_distance).to eq(20)
    end
    it '.average_distance' do
      trip = Trip.create(name: 'Fun trip')
      trail_1 = trip.trails.create(name: 'Old Rag', address: 'Virginia', length: 9)
      trail_2 = trip.trails.create(name: 'Mt Elbert', address: 'Colorado', length: 11)

      expect(trip.average_distance).to eq(10)
    end
  end
end
