FactoryGirl.define do
  factory :answer do
    question
    content Faker::Name.title
  end
end
