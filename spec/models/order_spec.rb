require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @category = Category.create!(name: 'Testing')
      @product1 = Product.create!(name: "Product_1",
                                  description: "description_1",
                                  image: 'image_1',
                                  price_cents: 10000,
                                  quantity: 14,
                                  category_id: @category.id)
      @product2 = Product.create!(name: "Product_2",
                                  description: "description_2",
                                  image: 'image_2',
                                  price_cents: 10000,
                                  quantity: 10,
                                  category_id: @category.id)
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(email: 'hjd007wwkd@hotmail.com',
                        total_cents: 10000,
                        stripe_charge_id: '1234')
      # 2. build line items on @order
      @order.line_items.new(product: @product1, quantity: 1,
                            item_price: @product1.price,
                            total_price: @product1.price * 1)
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(13)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      @order = Order.new(email: 'hjd007wwkd@hotmail.com',
                        total_cents: 10000,
                        stripe_charge_id: '1234')
      @order.line_items.new(product: @product1, quantity: 1, item_price: @product1.price, total_price: @product1.price * 1)
      @order.save!
      @product1.reload
      @product2.reload
      expect(@product2.quantity).to eq(10)

    end
  end
end
