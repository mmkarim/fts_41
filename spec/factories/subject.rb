FactoryGirl.define do
  factory :subject do
    title Faker::Name.title
    duration Faker::Number.digit

    factory :invalid_title do
      title ""
    end

    factory :invalid_duration do
      duration ""
    end
  end
end
