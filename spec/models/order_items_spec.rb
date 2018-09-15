require 'rails_helper'

describe OrderItem, type: :model do
  describe 'validations' do
    it {should validate_presence_of :item_id}
    it {should validate_presence_of :order_id}
  end

  describe 'relationships' do
    it {should belong_to :item}
    it {should belong_to :order}
  end
end
