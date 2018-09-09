class RemoveEndStationFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_index :trips, :end_station_id
  end
end
