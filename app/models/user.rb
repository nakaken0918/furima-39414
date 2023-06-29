class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は英字と数字の両方を含めてください" }

  with_options presence: true do
    validates :nick_name    
    validates :last_name,       format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角文字を入力してください" }
    validates :first_name,      format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角文字を入力してください" }
    validates :last_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カナを入力してください" }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カナを入力してください" }
    validates :birth_date
  end

end
