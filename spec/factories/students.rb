FactoryBot.define do
  factory :student do
    firstName { "Bruce" }
    lastName { "Wayne" }
    association :user
  end
end
