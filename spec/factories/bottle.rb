FactoryBot.define do
  factory :bottle do
    name { Faker::Name.name }
    country { "france" }
    domaine_name { Faker::Company.name }
    producer_name { Faker::Name.name }
    appelation { Faker::Lorem.word }
    region { "beaujolais" }
    color { "red" }
    year { 1988 }
    user
    producer
  end
end
