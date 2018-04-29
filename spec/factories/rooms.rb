FactoryBot.define do
  factory :room do
    sequence(:name){|n| "room_#{n}"+Faker::Hobbit.location}
  end

end
