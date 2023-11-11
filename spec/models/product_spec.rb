require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a product with all four required fields set' do
      @category = Category.new(name: 'Foreign')
      @product = Product.new(name: 'Apple pear', price: 2559, quantity: 30, category: @category)
      @product.save
      expect(@product).to be_valid
    end
    it 'should throw an error when name is missing' do
      @category = Category.new(name: 'Foreign')
      @product = Product.new(name: nil, price: 2559, quantity: 30, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'should throw an error when quantity is missing' do
      @category = Category.new(name: 'Foreign')
      @product = Product.new(name: 'Apple pear', price: 2599, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'should throw an error when price is missing' do
      @category = Category.new(name: 'Foreign')
      @product = Product.new(name: 'Apple pear', quantity: 30, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include ("Price can't be blank")
    end
    it 'should throw an error when category is missing' do
      @category = Category.new(name: 'Foreign')
      @product = Product.new(name: 'Apple pear', price: 2559, quantity: 30, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
