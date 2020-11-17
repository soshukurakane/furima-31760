FactoryBot.define do
  factory :item do
    title { '商品名' }
    category_id { 5 }
    status_id { 5 }
    burden_id { 2 }
    area_id { 3 }
    day_id { 2 }
    selling_price { 1000 }
    explanation { Faker::Lorem.sentence }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
