FactoryBot.define do
  factory :message do
    title { Faker::Lorem.sentence }
    prefectures_id { 2 }
    municipalities          { '東京都' }
    category_id             { 2 }
    association :user
    association :room

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
