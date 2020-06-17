FactoryBot.define do
  factory :address do
    street1 { "MyString" }
    street2 { "MyString" }
    state { "MyString" }
    zip { 1 }
    county { "MyString" }
    type { "" }
    student { nil }
  end
end
