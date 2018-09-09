class Item < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :image_url
end
