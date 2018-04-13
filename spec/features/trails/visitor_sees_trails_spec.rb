require 'rails_helper'

describe 'As a user' do
  context 'when I visit trail show page' do
    it 'I see all trips' do
      trail = Trail.create(name: 'Mt Elbert', address: 'Colorado', length: 11)
      trip_1 = trail.trips.create(name: 'v fun adventure')
      trip_2 = trail.trips.create(name: 'v v fun adventure')

      visit trail_path(trail)

      expect(page).to have_content(trip_1.name)
      expect(page).to have_content(trip_2.name)
    end
    it 'I see everything about the hike' do
      trail = Trail.create(name: 'Mt Elbert', address: 'Colorado', length: 11)

      visit trail_path(trail)

      expect(page).to have_content(trail.name)
      expect(page).to have_content(trail.address)
      expect(page).to have_content(trail.length)
    end
    it 'I see the total number of trips this hike has been included in' do
      trail = Trail.create(name: 'Mt Elbert', address: 'Colorado', length: 11)
      trip_1 = trail.trips.create(name: 'v fun adventure')
      trip_2 = trail.trips.create(name: 'v v fun adventure')

      visit trail_path(trail)

      expect(page).to have_content("This hike is included on #{trail.trip_count} trips!")
    end
  end
end
