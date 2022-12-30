FactoryBot.define do
  factory :customer, aliases: [:user] do

    transient do
      upcased {false}
    end

    name {Faker::Name.name}
    # email { Faker::Internet.email}
    # email { "maria2@maria.com" }

    sequence(:email, 3) { |n| "meu_email-#{n}@email.com"}

    trait :female do
      gender {"F"}
    end

    trait :male do
      gender {"M"}
    end

    trait :vip do
      vip {true}
      days_to_pay {30}
    end

    trait :default do
      vip {false}
      days_to_pay {15}
    end

    factory :customer_female, traits: [:female]
    factory :customer_female_default, traits: [:female, :default]
    factory :customer_female_vip, traits: [:female, :vip]
    factory :customer_male, traits: [:male]
    factory :customer_male_default, traits: [:male, :default]
    factory :customer_male_vip, traits: [:male, :vip]

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end