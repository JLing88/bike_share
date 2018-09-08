class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.date :start_date
      t.references :start_station, class_name: 'Station'
      t.date :end_date
      t.references :end_station, class_name: 'Station'
      t.integer :bike_id
      t.string :subscription_type
      t.integer :zip_code
    end
  end
end
