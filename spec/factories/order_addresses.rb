FactoryBot.define do 
  factory :order_address do
    token         { "tok_abcdefghijk00000000000000000" }
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { 'どこぞの市' }
    addresses     { '46-49' }
    building_name { 'なんちゃらハイツ2-2' }
    phone_number  { '08012345678' }
  end
end
