FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:title) { Faker::Book.title }
end
