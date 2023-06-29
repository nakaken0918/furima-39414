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
  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :price, format: { with: /\A[0-9]+\z/, message: "は半角数値を入力してください"}
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "の設定が範囲外です"}
  
  
  private

  def validate_image
    if image.blank?
      errors.add(:image, "のファイルを選択してください")
    end
  end

end
