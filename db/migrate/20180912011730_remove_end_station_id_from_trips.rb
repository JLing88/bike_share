class RemoveEndStationIdFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :start_station_id, :integer
    remove_column :trips, :end_station_id, :integer
  end
end
