require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do

    context "商品を出品できる" do

      it "全ての項目が正確に記入されている" do
        expect(@item).to be_valid
      end

    end

    context "商品を出品できない" do

      it "画像が空欄である" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像のファイルを選択してください")
      end

      it "商品名が空欄である" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it "商品説明が空欄である" do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it "カテゴリーが選択されていない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it "商品の状態が選択されていない" do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it "配送料が選択されていない" do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it "発送元の地域が選択されていない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it "発送までの日数が選択されていない" do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it "価格が空欄である" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end

      it "価格が半角数値でない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格の設定が範囲外です")
      end

      it "価格が300円未満の数値である" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("価格の設定が範囲外です")
      end

      it "価格が9,999,999を超える数値である" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格の設定が範囲外です")
      end

      it "出品者情報が無い" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end

  end

end
