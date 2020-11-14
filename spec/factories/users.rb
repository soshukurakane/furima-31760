FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"斎藤"}
    first_name            {"隆"}
    last_name_kana        {"サイトウ"}
    first_name_kana       {"タカシ"}
    birthday              {"1939-07-03"}

  end
end