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
        installation_date: Date.strptime(row[:installation_date], "%m/%d/%Y")
      )
    end
  end


  Condition.destroy_all
  CSV.foreach("db/csv/conditions.csv", headers: true, header_converters: :symbol) do |row|
    if row[:date] && row[:max_temperature_f] && row[:mean_temperature_f] && row[:min_temperature_f] && row[:mean_humidity] && row[:mean_visibility_miles] && row[:mean_wind_speed_mph] && row[:precipitation_inches]
      Condition.create(
        date: Date.strptime(row[:date], "%m/%d/%Y"),
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
        start_date: Date.strptime(row[:start_date], "%m/%d/%Y"),
        start_station_id: row[:start_station_id],
        end_date: Date.strptime(row[:end_date], "%m/%d/%Y"),
        end_station_id: row[:end_station_id],
        bike_id: row[:bike_id],
        subscription_type: row[:subscription_type],
        zip_code: row[:zip_code])
    end
  end

  Item.destroy_all
  image_array = ['https://static1.squarespace.com/static/548f8051e4b0155e1e517029/56ec47608259b54cf1f12c09/56ec47608259b54cf1f12c0a/1458325348859/6_BeerHolder+black.jpg',
                 'https://i.pinimg.com/originals/e9/1a/49/e91a49f7be6c9dc65c0c5fa2c197fecb.jpg',
                 'http://www.funnykittensite.com/pictures/Bike_Basket_Of_Kitten.jpg']
  20.times do |num|
    Item.create(title: "Item-#{num}", description: "Some Stuff-#{num}", price: rand(50.0...100.0).round(2), image_url: image_array.shuffle.first)
  end

  Order.destroy_all
  status_array = ["ordered", "completed", "paid", "cancelled"]
  user1 = User.create!(username: "person1", password: "111111", first_name: "firstname", last_name: "lastname", address: "place")
  user2 = User.create!(username: "person2", password: "111111", first_name: "firstname", last_name: "lastname", address: "place")
  user3 = User.create!(username: "person2", password: "111111", first_name: "firstname", last_name: "lastname", address: "place")
  user_array = [user1, user2, user3]
  20.times do |num|
    Order.create!(user_id: user_array.shuffle.first, status: status_array.shuffle.first)
  end

  User.create!(username: "Admin", password: "111111", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

  ActiveRecord::Base.connection.reset_pk_sequence!('stations')
  ActiveRecord::Base.connection.reset_pk_sequence!('trips')
  ActiveRecord::Base.connection.reset_pk_sequence!('conditions')
end
