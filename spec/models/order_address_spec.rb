require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
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
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号が空欄である" do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号が「3桁ハイフン4桁」の形になっていない" do
      @order_address.postal_code = 'A12-B345'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
    end

    it "郵便番号が半角でない" do
      @order_address.postal_code = '１２３－４５６７'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
    end

    it "都道府県が選択されていない" do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "市区町村が空欄である" do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it "番地が空欄である" do
      @order_address.addresses = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
    end

    it "電話番号が空欄である" do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号が 9 桁以下である" do
      @order_address.phone_number = 123456789
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is too short")
    end

    it "電話番号にハイフンが含まれている" do
      @order_address.phone_number = '123-4567-8912'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
    end

    it "電話番号が半角数値でない" do
      @order_address.phone_number = '０８０１２３４５６７８'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
    end
  end
end
