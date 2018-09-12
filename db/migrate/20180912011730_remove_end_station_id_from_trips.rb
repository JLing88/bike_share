class RemoveEndStationIdFromTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips
    remove_column :trips, :start_station_id, :integer
    remove_column :trips, :end_station_id, :integer
  end
end
