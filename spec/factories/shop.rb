FactoryBot.define do
  factory :shop do
    name {Faker::Lorem.characters(number:10)}
    location {Faker::Lorem.characters(number:30) }
    business_start_hours {Faker::Time.at(rand*Time.now.to_i)}
    business_finish_hours {Faker::Time.at(rand*Time.now.to_i)}
    genre {association :genre}
    user {associacion :user}
    holiday {Faker::Base.sample(["月曜日","火曜日","水曜日","木曜日","金曜日","土曜日","日曜日"])}
  end
end