require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do

    context "ユーザー登録できる" do

      it "全ての項目が正確に記入されている" do
        expect(@user).to be_valid
      end

    end
    
    context "ユーザー登録できない" do
      
      it "ニックネームが空欄である" do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "メールアドレスが空欄である" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "メールアドレスに「@」が含まれていない" do
        @user.email = "testmail"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "メールアドレスが既に登録されている" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it "パスワードが空欄である" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "パスワードが5文字以下である" do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it "パスワードに英字と数字が含まれていなければならない" do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含めてください")
      end
      it "パスワードに全角文字が含まれている" do
        @user.password = 'A12345６'
        @user.password_confirmation = 'A12345６'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めてください')
      end
      it "パスワード(確認)がパスワードと一致しない" do
        @user.password = 'A123456'
        @user.password_confirmation = 'B123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "名字が空欄である" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it "名字が全角文字でない" do
        @user.last_name = "Nekoda"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は全角文字を入力してください")
      end
      it "名前が空欄である" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "名前が全角文字でない" do
        @user.first_name = "Taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角文字を入力してください")
      end
      it "名字(カナ)が空欄である" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）を入力してください")
      end
      it "名字(カナ)が全角カタカナでない" do
        @user.last_name_kana = "猫田"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）は全角カナを入力してください")
      end
      it "名前(カナ)が空欄である" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it "名前(カナ)が全角カタカナでない" do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は全角カナを入力してください")
      end
      it "生年月日に空欄がある" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end

  end
end
