FactoryGirl.define do
    factory :idea do
      title { Faker::Hipster.word }
      body { Faker::Hipster.sentence }
      quality { Faker::Number.between(0, 3) }
    end
end
