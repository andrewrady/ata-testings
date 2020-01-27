require 'rails_helper'

RSpec.describe InventoryController, type: :controller do
  login_user
  before(:each) do
    User.create!(:email => 'test1@gmail.com', :password => 'password')
    @inventory = Inventory.create(name: "Head Gear", cost: 12.99, price: 19.99, user_id: User.first.id, distributor: "WMA", tax: true)
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
      post :create, params: { inventory: { name: "Chrest Protector", cost: 24.99, price: 49.99, user_id: User.first.id, distributor: "WMA", tax: true }}
      expect(response).to redirect_to inventory_index_path
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

  describe "PUT inventory/:id" do
    it "renders edit template" do
      get :edit, params: { id: @inventory.id }
      expect(response).to render_template(:edit)  
    end

    it "successfully updates the inventory record" do
      patch :update, params: { id: @inventory.id, inventory: { name: "Chest Protector", cost: 26.99, price: 54.99, user_id: User.first.id, distributor: "WMA"}}
      @inventory.reload
      expect(@inventory.name).to eq("Chest Protector")
    end

    it "render form if update was not successful" do
      patch :update, params: { id: @inventory.id, inventory: { name: "", cost: 26.99, price: 54.99, user_id: User.first.id, distributor: "WMA"}}
      @inventory.reload
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE inventory/:id" do
    it "deletes record" do
      delete :destroy, params: { id: @inventory.id }
      expect(response).to redirect_to inventory_index_path
    end
  end
end
