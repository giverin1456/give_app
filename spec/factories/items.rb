FactoryBot.define do
  factory :item do
    name                {Faker::Name.initials(number: 10)}
    text                {'aaaa'}
    category_id         {3}
    status_id           {3}
    delivery_charge_id  {3}
    prefecture_id       {3}
    day_id              {3}
    price               {3000}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
end