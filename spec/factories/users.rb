FactoryBot.define do
  factory :user do
    nickname                      { Faker::Name.initials(number: 2) }
    email                             { Faker::Internet.free_email }
    password                      { 'g4' + Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    birth_date                     { '1985-8-13' }
    gender                          { 'man' } 
  end
end