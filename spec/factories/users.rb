FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'Abcd1234' }
    password_confirmation { password }
    last_name             { '高海' }
    first_name            { '千歌' }
    lname                 { 'タカミ' }
    fname                 { 'チカ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
