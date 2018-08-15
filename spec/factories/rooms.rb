FactoryBot.define do
  factory :room do
    name { Faker::StarWars.character }
    resident_id nil
  end
end