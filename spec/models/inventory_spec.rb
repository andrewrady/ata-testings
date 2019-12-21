require 'rails_helper'

RSpec.describe Inventory, type: :model do
  before(:each) do
    User.create!(:email => 'test1@gmail.com', :password => 'password')
  end
  context "validation for inventory creation" do
    it "ensures name presence" do
      inventory = Inventory.new
      inventory.cost = 12.99
      inventory.price = 19.99
      inventory.user_id = User.first.id
      
      inventory.valid?
      expect(inventory.errors[:name]).to include("can't be blank")
    end

    it "ensures the price presence" do
      inventory = Inventory.new
      inventory.name = "Head Gear"
      inventory.cost = 19.99
      inventory.user_id = User.first.id

      inventory.valid?
      expect(inventory.errors[:price]).to include("can't be blank")
    end

    it "ensures the price is a number" do
      inventory = Inventory.new
      inventory.name = "Head Gear"
      inventory.price = "fifty"
      inventory.cost = 19.99
      inventory.user_id = User.first.id

      inventory.valid?
      expect(inventory.errors[:price]).to include("is not a number")
    end

    it "ensures the cost is a number" do
      inventory = Inventory.new
      inventory.name = "Head Gear"
      inventory.price = 20
      inventory.cost = "hundred"
      inventory.user_id = User.first.id

      inventory.valid?
      expect(inventory.errors[:cost]).to include("is not a number")
    end

    it "ensures the cost presence" do
      inventory = Inventory.new
      inventory.name = "Head Gear"
      inventory.price = 19.99
      inventory.user_id = User.first.id

      inventory.valid?
      expect(inventory.errors[:cost]).to include("can't be blank")
    end

    it "ensures the successfully save" do
      expect(Inventory.create(name: "Head Gear", cost: 12.99, price: 19.99, user_id: User.first.id, distributor: "WMA" )).to be_valid
    end
  end
end
