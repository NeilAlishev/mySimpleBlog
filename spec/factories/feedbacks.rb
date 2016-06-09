FactoryGirl.define do
  factory :feedback do
    name { Faker::Name.name }
    email
    text "Very nice!"
    subject "some subject"
  end
end
