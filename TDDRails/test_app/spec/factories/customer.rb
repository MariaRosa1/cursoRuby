FactoryBot.define do
  factory :customer do
    name {Faker::Name.name}
    email { Faker::Internet.email}
    # email { "maria2@maria.com" }
  end
end