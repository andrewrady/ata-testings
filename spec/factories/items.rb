FactoryBot.define do
  factory :item do
    name { "MyString" }
    price { 1.5 }
    tax { false }
    pos_records_item { nil }
  end
end
