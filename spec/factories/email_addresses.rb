FactoryBot.define do
  factory :email_address do
    email { "MyString" }
    type { "" }
    student { nil }
  end
end
