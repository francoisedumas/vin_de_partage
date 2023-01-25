FactoryBot.define do
  factory :bottle do
    name { Faker::Name.name }
    country { "france" }
    domaine_name { Faker::Company.name }
    producer { Faker::Name.name }
    appelation { Faker::Lorem.word }
    region { "beaujolais" }
    color { "red" }
    year { Faker::Number.between(1900, Time.current.year) }
    user
  end
end
