class ConditionsDashboardController < ApplicationController
  def show
    @forty_to_fifty_temp_range = (Condition.number_rides_per_condition_type('max_temp', 40.0, 49.9).values[0].to_f/Trip.count).round(2)
    @fifty_to_sixty_temp_range = (Condition.number_rides_per_condition_type('max_temp', 50.0, 59.9).values[0].to_f/Trip.count).round(2)
    @sixty_to_seventy_temp_range = (Condition.number_rides_per_condition_type('max_temp', 60.0, 69.9).values[0].to_f/Trip.count).round(2)
    @seventy_to_eighty_temp_range = (Condition.number_rides_per_condition_type('max_temp', 70.0, 79.9).values[0].to_f/Trip.count).round(2)
    @eighty_to_ninety_temp_range = (Condition.number_rides_per_condition_type('max_temp', 80.0, 89.9).values[0].to_f/Trip.count).round(2)
    @ninety_to_hundo_temp_range = (Condition.number_rides_per_condition_type('max_temp', 90.0, 100).values[0].to_f/Trip.count).round(2)
  end
end
