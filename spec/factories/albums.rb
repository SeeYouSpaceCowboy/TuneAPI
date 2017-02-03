FactoryGirl.define do
  factory :album do
    title Faker::Book.title 
    artist Artist.all.sample
  end
end
