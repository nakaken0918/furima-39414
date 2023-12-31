class OrderAddress

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は次のように入力します（例：123-4567）"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "を選択してください"}
    validates :city
    validates :addresses
    validates :phone_number, length: {minimum: 10, message: "は10桁以上を入力してください"}, format: {with: /\A[0-9]{10,11}\z/, message: "は半角数値を入力してください"}
  end
  
  def save
    
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number, order_id: order.id)

  end

end