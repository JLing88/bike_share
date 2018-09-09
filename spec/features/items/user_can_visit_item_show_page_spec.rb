require 'rails_helper'

describe 'As a User' do
  context 'they can see a single item' do
    it 'displays item information on show page' do
      item_1 = Item.create(title: "Widget", description: "Something Sweet", price: 1.99, image_url: "123.com")

      visit item_path(item_1)

      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_1.description)
      expect(page).to have_content("Price: $#{item_1.price}")
    end

    it 'shows Add to Cart button' do
      item_1 = Item.create(title: "Widget", description: "Something Sweet", price: 1.99, image_url: "123.com")

      visit item_path(item_1)

      expect(page).to have_link("Add to Cart")
      #click_on "Add to Cart"
      #expect(current_path).to eq(item_path(item_1))
    end
  end
end
