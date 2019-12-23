require 'rails_helper'

RSpec.describe InventoryController, type: :controller do
  before(:each) do
    User.create!(:email => 'test1@gmail.com', :password => 'password')
    @inventory = Inventory.create(name: "Head Gear", cost: 12.99, price: 19.99, user_id: User.first.id, distributor: "WMA")
  end
  describe "GET /inventory" do
    it "ensures @invetory gets assign" do
      get :index

      expect(@inventory.name).to eq("Head Gear")
    end

    it "render index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET /inventory/new" do
    it "render new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST /inventory" do
    login_user
    it "create new inventory item" do
      post :create, params: { inventory: { name: "Chrest Protector", cost: 24.99, price: 49.99, user_id: User.first.id, distributor: "WMA" }}
      expect(response).to redirect_to Inventory.last
    end
  end

  describe "GET inventory/:id" do
    it "GET action" do
      get :show, params: { id: @inventory.id }
      expect(response).to render_template(:show)
    end

    it "renders correct data" do
      get :show, params: { id: @inventory.id }
      expect(@inventory.name).to eq("Head Gear")
    end
  end

  # describe "POST inventory/:id" do

  # end
end
