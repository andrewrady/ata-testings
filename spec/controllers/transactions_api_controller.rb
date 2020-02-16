require 'rails_helper'
require 'faker'
require 'v1/transactions_controller'

RSpec.describe V1::TransactionsController, type: :controller do
  before(:each) do
    User.create!(email: "test1@gmail.com", password: "password")
    Student.create!(firstName: Faker::Name, lastName: Faker::Name, user_id: User.first.id)
    @transaction = Transaction.create!(total: 199.99, tax: 6, discount: 0, authResponse: "Approved 668013", authCode: "668013", referenceNumber: "576570", orderId: "635742957909628443", student_id: Student.first.id)
  end

  describe "POST v1/transactions" do
    it "creates a new transaction" do
      post :create, params: { 
        transaction: { 
          total: "1.00", 
          tax: 6, 
          cardNumber: "6011188120789240", 
          cardExpMonth: "02", 
          cardExpYear: "21", 
          discount: 0,
          ownerName: "Chuck Norris",
          ownerStreet: "1600 Pennsylvania Ave NW",
          ownerCity: "Washington",
          ownerState: "DC",
          ownerZip: "20500"
        }, 
        student: { id: Student.first.id}}
      expect(response).to have_http_status(:success)
    end
  end


end
