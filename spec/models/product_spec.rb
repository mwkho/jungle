require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do 
    it 'create a product with all fields set and saves sucessfully' do 
      @category = Category.create(name: 'Food')
      # id = @category.id
      @product = Product.create(name: 'product 1', description: 'A product', image: 'product1 image', price_cents: 100, quantity: 3, category: @category)
      expect(@product).to be_present
    end

    it 'should not save a product without a category' do
      @product = Product.new(name: 'product 1', description: 'A product', image: 'product1 image', price_cents: 100, quantity: 3, category: nil)
      @product.validate
      expect(@product.errors.full_messages).not_to be_empty
    end
    it 'should not save a product without a name' do
      @category = Category.new(name: 'Plants')
      @product = Product.new(name: nil, description: 'A product', image: 'product1 image', price_cents: 100, quantity: 3, category: @category)
      @product.validate
      expect(@product.errors.full_messages).not_to be_empty
    end
    it 'should not save a product without a quantity' do
      @category = Category.new(name: 'Plants')
      @product = Product.new(name: 'product3', description: 'A product', image: 'product1 image', price_cents: 100, quantity: nil, category: @category)
      @product.validate
      expect(@product.errors.full_messages).not_to be_empty
    end
    it 'should not save a product without a price' do
      @category = Category.new(name: 'Plants')
      @product = Product.new(name: 'product3', description: 'A product', image: 'product1 image', price_cents: nil, quantity: 1, category: @category)
      @product.validate
      expect(@product.errors.full_messages).not_to be_empty
    end

  end
end
