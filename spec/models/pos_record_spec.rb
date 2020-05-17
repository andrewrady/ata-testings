require 'rails_helper'

RSpec.describe PosRecord, type: :model do
  before(:each) do
    User.create(email: "test!@gmail.com", password: "password")
  end
  context "validates transaction creation" do
    it "ensures total presence" do
      transaction = PosRecord.new
      transaction.tax = 6
      transaction.discount = 0
      transaction.authResponse = "Approved 668013"
      transaction.authCode = 668013
      transaction.referenceNumber = 576570
      transaction.orderId = 635742957909628443
      transaction.valid?
      expect(transaction.errors[:total]).to include("can't be blank")
    end

  end
end
