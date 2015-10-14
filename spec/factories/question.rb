FactoryGirl.define do
  factory :question do
    content Faker::Name.title
    subject
  end
end
