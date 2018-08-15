FactoryBot.define do
  factory :resident do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    dob { Faker::Date.birthday(65, 150) }
    favourite_food { Faker::Food.dish }
  end
end