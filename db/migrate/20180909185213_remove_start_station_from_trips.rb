class RemoveStartStationFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_index :trips, :start_station_id
  end
end
