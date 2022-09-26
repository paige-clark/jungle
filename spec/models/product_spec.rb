require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    ###########################################
    it "should save successfully" do
      @category = Category.new(id: 5,
                               name: "eggs",
                               created_at: DateTime.now - 1.week,
                               updated_at: DateTime.now)
      @product = Product.new(name: "hard boiled",
                             category: @category,
                             price: 400,
                             quantity: 40)
      @product.save!
      pp @product.id
      expect(@product.id).to be_present
    end
    ###########################################
    it "validate :name, presence: true" do
      @category = Category.new(id: 5,
                               name: "eggs",
                               created_at: DateTime.now - 1.week,
                               updated_at: DateTime.now)
      @product = Product.new(name: nil,
                             category: @category,
                             price: 400,
                             quantity: 40)
      @product.validate
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    ###########################################
    it "validates :price, presence: true" do
      @category = Category.new(id: 5,
                               name: "eggs",
                               created_at: DateTime.now - 1.week,
                               updated_at: DateTime.now)
      @product = Product.new(name: "hard boiled",
                             category: @category,
                             quantity: 40)
      @product.validate
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    ###########################################
    it "validates quantity, presence: true" do
      @category = Category.new(id: 5,
                               name: "eggs",
                               created_at: DateTime.now - 1.week,
                               updated_at: DateTime.now)
      @product = Product.new(name: "hard boiled",
                             category: @category,
                             price: 400,
                             quantity: nil)
      @product.validate
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    ###########################################
    it "validates :category, presence: true" do
      @category = Category.new(id: 5,
                               name: "eggs",
                               created_at: DateTime.now - 1.week,
                               updated_at: DateTime.now)
      @product = Product.new(name: "hard boiled",
                             category: nil,
                             price: 400,
                             quantity: 40)
      @product.validate
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
