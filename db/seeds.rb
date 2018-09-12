require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == 'development' || Rails.env == 'production'
  Station.destroy_all
  CSV.foreach("db/csv/station.csv", headers: true, header_converters: :symbol) do |row|
    if row[:id] && row[:name] && row[:dock_count] && row[:city] && row[:installation_date]
      Station.create!(
        id: row[:id],
        name: row[:name],
        dock_count: row[:dock_count],
        city: row[:city],
        installation_date: Date.strptime(row[:installation_date], "%m/%d/%y")
      )
    end
  end


  Condition.destroy_all
  CSV.foreach("db/csv/conditions.csv", headers: true, header_converters: :symbol) do |row|
    if row[:date] && row[:max_temperature_f] && row[:mean_temperature_f] && row[:min_temperature_f] && row[:mean_humidity] && row[:mean_visibility_miles] && row[:mean_wind_speed_mph] && row[:precipitation_inches]
      Condition.create(
        date: Date.strptime(row[:date], "%m/%d/%y"),
        max_temp: row[:max_temperature_f],
        mean_temp: row[:mean_temperature_f],
        min_temp: row[:min_temperature_f],
        mean_humidity: row[:mean_humidity],
        mean_visibility: row[:mean_visibility_miles],
        mean_windspeed: row[:mean_wind_speed_mph],
        precipitation: row[:precipitation_inches])
    end
  end

  Trip.destroy_all
  CSV.foreach("db/csv/small_trip.csv", headers: true, header_converters: :symbol) do |row|
    if row[:duration] && row[:start_date] && row[:start_station_id] && row[:end_date] && row[:end_station_id] && row[:bike_id] && row[:subscription_type] && row[:zip_code]
      Trip.create(
        duration: row[:duration],
        start_date: Date.strptime(row[:start_date], "%m/%d/%y"),
        start_station_id: row[:start_station_id],
        end_date: Date.strptime(row[:end_date], "%m/%d/%y"),
        end_station_id: row[:end_station_id],
        bike_id: row[:bike_id],
        subscription_type: row[:subscription_type],
        zip_code: row[:zip_code])
    end
  end
  ActiveRecord::Base.connection.reset_pk_sequence!('stations')
  ActiveRecord::Base.connection.reset_pk_sequence!('trips')
  ActiveRecord::Base.connection.reset_pk_sequence!('conditions')
end
