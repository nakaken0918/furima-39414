require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  describe "商品購入" do
    before do
      @user ||= FactoryBot.create(:user)
      @item ||= FactoryBot.create(:item, user: @user)
      @order_address ||= FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    end
  
    context '購入できる場合' do
      it "必須情報が全て正確に入力されている" do
        expect(@order_address).to be_valid
      end
  
      it "建物名は空欄でも良い" do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end
  
    context '購入できない場合' do
      it "カード情報に空欄や不備がある（トークンが生成されない）" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
  
      it "郵便番号が空欄である" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
  
      it "郵便番号が「3桁ハイフン4桁」の形になっていない" do
        @order_address.postal_code = 'A12-B345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は次のように入力します（例：123-4567）")
      end
  
      it "郵便番号が半角でない" do
        @order_address.postal_code = '１２３－４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は次のように入力します（例：123-4567）")
      end
  
      it "都道府県が選択されていない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
      end
  
      it "市区町村が空欄である" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
  
      it "番地が空欄である" do
        @order_address.addresses = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
  
      it "電話番号が空欄である" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
  
      it "電話番号が 9 桁以下である" do
        @order_address.phone_number = 123456789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は10桁以上を入力してください")
      end
  
      it "電話番号が 12 桁以上である" do
        @order_address.phone_number = 123456789123
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は半角数値を入力してください")
      end
  
      it "電話番号にハイフンが含まれている" do
        @order_address.phone_number = '123-4567-8912'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は半角数値を入力してください")
      end
  
      it "電話番号が半角数値でない" do
        @order_address.phone_number = '０８０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は半角数値を入力してください")
      end

      it "出品者が存在しない（userが紐付いていない）" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
  
      it "商品が存在しない（itemが紐付いていない）" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
