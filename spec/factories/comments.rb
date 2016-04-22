FactoryGirl.define do
  factory :comment do
    content { Faker::Lorem.sentence }
    article
  end
end
