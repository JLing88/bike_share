class AddDefaultToItemImageUrl < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :image_url, :string, default: 'item.jpg'
  end
end
