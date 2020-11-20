FactoryBot.define do
  factory :order_address do
    post_code {'123-4567'}
    prefecture_id {1}
    city  {'東京都'}
    address {'青山1-1-1'}
    building {'東京ハイツ'}
    phone_num {'09029784490'}
  end
end
