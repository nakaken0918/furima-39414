class Item < ApplicationRecord

  has_one_attached :image
  validate :validate_image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  belongs_to :user
  has_one :order
  
  validates :name, :info, :price, presence: true
  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters"}
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  
  
  private

  def validate_image
    if image.blank?
      errors.add(:image, "can't be blank")
    end
  end

end
