require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.create(name: "Testing")
  end
  it 'should create a product if all of the validations are true' do
    @product = Product.new(name: "Great Sofa", price_cents: 1200, quantity: 20, category_id: @category.id)
    expect(@product).to (be_valid)
  end
  it 'should not create a product if the name is missing' do
    @product = Product.new(price_cents: 1200, quantity: 20, category_id: @category.id)
    expect(@product).to_not (be_valid)
    expect(@product.errors.full_messages).to include("Name can't be blank")
  end
    it 'should not create a product if the quantity is missing' do
    @product = Product.new(name: "Great sofa", price_cents: 1200, category_id: @category.id)
    expect(@product).to_not (be_valid)
    expect(@product.errors.full_messages).to include("Quantity can't be blank")
  end
    it 'should not create a product if the price is missing' do
    @product = Product.new(name: "Great sofa", quantity: 20, category_id: @category.id)
    expect(@product).to_not (be_valid)
    expect(@product.errors.full_messages).to include("Price can't be blank")
  end
    it 'should not create a product if the category is missing' do
    @product = Product.new(name: "Great sofa", price_cents: 1200, quantity: 20)
    expect(@product).to_not (be_valid)
    expect(@product.errors.full_messages).to include("Category can't be blank")
  end
end
