FactoryBot.define do
  factory :user do
    nick_name             { "ねこやん" }
    email                 { "nekoda@test.com" }
    password              { "nekoneko9" }
    password_confirmation { "nekoneko9" }
    last_name             { "猫田" }
    first_name            { "太郎" }
    last_name_kana        { "ネコダ" }
    first_name_kana       { "タロウ" }
    birth_date            { "1988-08-17" }
  end
end