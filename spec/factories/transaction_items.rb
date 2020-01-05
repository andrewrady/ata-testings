FactoryBot.define do
  factory :transaction_item do
    name { "MyString" }
    price { 1.5 }
    quantity { 1 }
    discount { 1 }
    transactions { nil }
  end
end
