FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'大樹'}
    last_name             {'儀武'}
    first_kana            {'タイキ'}
    last_kana             {'ギブ'}
    birthday              {'1980-03-04'}
  end
end