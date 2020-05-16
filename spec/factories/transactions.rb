FactoryBot.define do
  factory :transaction do
    association :student
    total { 1.5 }
    tax { false }
    discount { 1.5 }
    authResponse { "MyString" }
    authCode { "MyString" }
    referenceNumber { "MyString" }
    orderId { "MyString" }
  end
end
