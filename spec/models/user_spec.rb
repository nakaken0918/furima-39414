require 'rails_helper'

RSpec.describe User, type: :model do
  # FactoryBotの導入。
  before do
    @user = FactoryBot.build(:user)
  end

  # describe ...テストコードの説明。
  describe "ユーザー新規登録" do
    #///////////////////////////////////////////////////////////////////////////////////////////////////////nick_name
    it "nicknameが空欄では登録できない" do # it ...どんな結果になるかを説明。内容の総称はexample。
      @user.nick_name = '' # 入力されるテストデータを作成。
      @user.valid? # user の値が正しいか(保存できるものなのか)をチェック。

      # full_messagesメソッド   ...生成されたエラーのメッセージを出力する。
      # includeマッチャ   ...指定した文字列が含まれているかをチェック。
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    #///////////////////////////////////////////////////////////////////////////////////////////////////////email
    it "emailが空欄では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailに@が含まれていなければ登録できない" do
      @user.email = "testmail"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    #///////////////////////////////////////////////////////////////////////////////////////////////////////password
    it "passwordが空欄では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下では登録できない" do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it "passwordに英字と数字が含まれていなければ登録できない" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it "password-confirmationがpasswordと一致しなければ登録できない" do
      @user.password = 'A123456'
      @user.password_confirmation = 'B123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    ##///////////////////////////////////////////////////////////////////////////////////////////////////////name
    it "Last-nameが空欄では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "Last-nameが全角文字でなければ登録できない" do
      @user.last_name = "Nekoda"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
    end

    it "First-nameが空欄では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "First-nameが全角文字でなければ登録できない" do
      @user.first_name = "Taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
    end

    it "Last-name-kanaが空欄では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "Last-name-kanaが全角カタカナでなければ登録できない" do
      @user.last_name_kana = "猫田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
    end

    it "First-name-kanaが空欄では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "First-name-kanaが全角カタカナでなければ登録できない" do
      @user.first_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
    end
    #///////////////////////////////////////////////////////////////////////////////////////////////////////birth
    it "birth-date(年月日)に空欄がある場合は登録できない" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
