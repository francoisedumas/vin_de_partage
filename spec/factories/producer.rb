FactoryBot.define do
  factory :producer do
    name { Faker::Name.name }
    region { "beaujolais" }
    domaine_name { Faker::Company.name }
    user
  end
end
