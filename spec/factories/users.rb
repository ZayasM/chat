FactoryBot.define do
  factory :user do
    nick { Faker::Hobbit.character }
  end
end
