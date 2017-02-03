FactoryGirl.define do
  factory :artist do
    name Faker::Name.first_name 
  end
end
