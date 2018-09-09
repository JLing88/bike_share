require 'rails_helper'

describe 'visitor visits page for one trip' do
  it 'links from trips index' do
    station_1 = Station.create!(name: 'Wads', dock_count: 15, city: 'Lakewood', installation_date: Time.now)
    station_2 = Station.create!(name: 'Fed Center', dock_count: 10, city: 'Golden', installation_date: Time.now)
    trip_1 = Trip.create!(duration: 60, start_date: Time.now, start_station_id: station_1.id, end_date: Time.now, end_station_id: station_2.id, bike_id: 1, subscription_type: 'monthly', zip_code: 80222)

    visit trips_path

    click_link "See Trip"

    expect(current_path).to eq(trip_path(trip_1))
    expect(page).to have_content(trip_1.duration)
    expect(page).to have_content(trip_1.start_date)
    expect(page).to have_content(trip_1.start_station_name(trip_1))
    expect(page).to have_content(trip_1.end_date)
    expect(page).to have_content(trip_1.end_station_name(trip_1))
    expect(page).to have_content(trip_1.bike_id)
    expect(page).to have_content(trip_1.subscription_type)
    expect(page).to have_content(trip_1.zip_code)
    end
end
