FactoryGirl.define do
  factory :article do
    title { Faker::Book.title }
    content { Faker::Lorem.sentence }
  end
end
