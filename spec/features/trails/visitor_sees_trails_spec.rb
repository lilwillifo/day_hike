require 'rails_helper'

describe 'As a user' do
  context 'when I visit trail show page' do
    it 'I see list of names of all trips' do
      trail = Trail.create(name: 'Mt Elbert', address: 'Colorado', length: 11)
      trip_1 = trail.trips.create(name: 'v fun adventure')
      trip_2 = trail.trips.create(name: 'v v fun adventure')

      visit trail_path(trail)

      expect(page).to have_content(trip_1.name)
      expect(page).to have_content(trip_2.name)
    end
  end
end
