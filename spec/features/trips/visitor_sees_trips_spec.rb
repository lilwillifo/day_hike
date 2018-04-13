require 'rails_helper'

describe 'As a visitor' do
  context 'when I visit the trips index and I click a link to a trip show' do
      it 'I see a list of trails on the trip and its name address and length' do
        trip = Trip.create(name: 'Fun trip')
        trail_1 = trip.trails.create(name: 'Old Rag', address: 'Virginia', length: 9)
        trail_2 = trip.trails.create(name: 'Mt Elbert', address: 'Colorado', length: 11)

        visit trips_path
        click_on trip.name

        expect(page).to have_content(trail_1.name)
        expect(page).to have_content(trail_1.address)
        expect(page).to have_content(trail_1.length)
        expect(page).to have_content(trail_2.name)
        expect(page).to have_content(trail_2.address)
        expect(page).to have_content(trail_2.length)
    end
  end
  context 'when I visit a trip show' do
    it 'I see the hiking distance stats' do
      trip = Trip.create(name: 'Fun trip')
      trail_1 = trip.trails.create(name: 'Old Rag', address: 'Virginia', length: 9)
      trail_2 = trip.trails.create(name: 'Mt Elbert', address: 'Colorado', length: 11)

      visit trip_path(trip)

      expect(page).to have_content ("Total Hiking Distance: #{trip.total_distance} miles.")
      expect(page).to have_content ("Average Hiking Distance: #{trip.average_distance} miles.")
      expect(page).to have_content ("Longest Hiking Distance: #{trip.longest_distance} miles.")
      expect(page).to have_content ("Shortest Hiking Distance: #{trip.shortest_distance} miles.")
    end
  end
end
