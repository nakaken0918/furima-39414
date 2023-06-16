class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nick_name
    validates :family_name      , format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "Last name is invalid. Input full-width characters" }
    validates :first_name       , format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "First name is invalid. Input full-width characters" }
    validates :family_name_kana , format: { with: /\A[ァ-ヶー－]+\z/, message: "Last name kana is invalid. Input full-width katakana characters" }
    validates :first_name_kana  , format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana is invalid. Input full-width katakana characters" }
    validates :birth
  end

end
