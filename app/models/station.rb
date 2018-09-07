class Station < ApplicationRecord
  validates_presence_of :name, :dock_count, :city, :installation_date
end
