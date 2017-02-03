FactoryGirl.define do 
  factory :song do
    title Faker::Hipster.word 
    album Album.all.sample
  end
end
