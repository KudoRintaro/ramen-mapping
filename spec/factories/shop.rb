FactoryBot.define do
  factory :shop do
    name {"ラーメン"}
    genre_id {association :genre}
    location {Faker::Lorem.characters(number:30) }
    business_start_hours {Faker::Time.backward(days: 7)}
    business_finish_hours {Faker::Time.backward(days: 7)}
    holiday {Faker::Base.sample(["月曜日","火曜日","水曜日","木曜日","金曜日","土曜日","日曜日"])}

    after(:build) do |shop|
      shop.image.attach(io: File.open('app/assets/images/ramen1.jpg'), filename: 'ramen1.jpg', content_type: 'application/xlsx')
    end
  end

  factory :genre do
    id {Faker::Number.number(digits:2)}
    name {Faker::Lorem.characters(number:10)}
  end

  factory :user do
    id {Faker::Number.number(digits:2)}
    name {Faker::Lorem.characters(number:20)}
    kana {Faker::Lorem.characters(number:20)}
    email {Faker::Internet.email}
    password {Faker::Number.number(digits:8)}
    status {Faker::Boolean.boolean(true_ratio: 1)}

    after(:build) do |user|
      user.image.attach(io: File.open('app/assets/images/ramen1.jpg'), filename: 'ramen1.jpg', content_type: 'application/xlsx')
    end
  end

  def sign_in(user)
    visit new_user_session_path
    fill_in 'test@user', with: user.email
    fill_in '19981082', with: user.password
    find('ログイン').click
  end
end