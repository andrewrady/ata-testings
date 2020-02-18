require 'rails_helper'
require 'v1/inventory_controller'

RSpec.describe V1::InventoryController, type: :controller do
  before(:each) do
    User.create!(:email => 'test1@gmail.com', :password => 'password')
    Inventory.create!(name: "Head Gear", price: 29.99, cost: 19.99, amount: 2, tax: true, user_id: User.first.id)
    Inventory.create!(name: "Sparring Gloves", price: 25.99, cost: 15.99, amount: 1, tax: true, user_id: User.first.id)
  end

  it "GET v1/inventory returns success status" do
    get :index, params: { id: 1 }
    expect(response).to have_http_status(:success)
  end

  it "GET v1/inventory returns content" do
    get :index, params: { id: User.first.id }
    json_response = JSON.parse(response.body)
    expect(json_response.length).to be(2)
    json_response = JSON.parse(response.body)
    expect(json_response[0]['name']).to eq('Head Gear')
  end

  it "POST v1/students/search" do
    post :search, params: { name: 'Chuck' }
    expect(response).to have_http_status(:success)
  end

  it "POST v1/inventory/search returns only one results" do
    post :search, params: { name: 'head' }
    json_response = JSON.parse(response.body)
    expect(json_response.length).to be(1)
    expect(json_response[0]['name']).to eq('Head Gear')
  end
end