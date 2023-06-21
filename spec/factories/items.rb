FactoryBot.define do
  factory :item do
    name                   { "超熟オムライス" }
    info                   { "ビンテージ品。食用厳禁。" }
    category_id            { 7 }
    sales_status_id        { 7 }
    shipping_fee_status_id { 2 }
    prefecture_id          { 2 }
    scheduled_delivery_id  { 2 }
    price                  { 420 }
    user                   { association(:user) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
