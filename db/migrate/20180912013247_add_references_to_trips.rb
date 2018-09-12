class AddReferencesToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :start_station_id, :integer
    add_column :trips, :end_station_id, :integer
    add_foreign_key :trips, :stations, column: :start_station_id, index: true
    add_foreign_key :trips, :stations, column: :end_station_id, index: true
  end
end
