FactoryBot.define do
  factory :message do
    text { Faker::Hobbit.quote }

    user_id nil
    room_id nil
  end
end
