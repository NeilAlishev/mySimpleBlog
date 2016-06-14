FactoryGirl.define do
  factory :article do
    title
    content { Faker::Lorem.sentence }
  end
end
