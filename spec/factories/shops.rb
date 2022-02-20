FactoryBot.define do
  factory :shop do
    name               {Faker::Name.initials(number: 2)}
    text               {'aaaaa'}
    shop_category_id   {3}
    prefecture_id      {3}
  end
end
