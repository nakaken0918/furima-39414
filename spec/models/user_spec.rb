require 'rails_helper'

RSpec.describe User, type: :model do
  # describe ...テストコードの説明。
  describe "ユーザー新規登録" do
    #///////////////////////////////////////////////////////////////////////////////////////////////////////nick_name
    # it ...どんな結果になるかを説明。内容の総称はexample。
    it "nicknameが空欄では登録できない" do
      # 入力されるテストデータを作成。
      user = User.new(nick_name: "")
      # user の値が正しいか(保存できるものなのか)をチェック。
      user.valid?

      # full_messagesメソッド   ...生成されたエラーのメッセージを出力する。
      # includeマッチャ   ...指定した文字列が含まれているかをチェック。
      expect(user.errors[:nick_name]).to include("can't be blank")
    end
    #///////////////////////////////////////////////////////////////////////////////////////////////////////email
    it "emailが空欄では登録できない" do
      user = User.new(email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "emailに@が含まれていなければ登録できない" do
      user = User.new(email: "testexample.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "既に登録済みのemailは登録できない" do
      # 登録済みのユーザーを作成。
      existing_user = User.create(email: "existing@example.com")
      # 同じemailを使って新しいユーザーを作成。
      user = User.new(email: "existing@example.com")
      
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
    #///////////////////////////////////////////////////////////////////////////////////////////////////////password
    it "passwordが空欄では登録できない" do
      user = User.new(password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordに英字と数字が含まれていなければ登録できない" do
      user = User.new(password: "password")
      user.valid?
      expect(user.errors[:password]).to include("Password is invalid. Include both letters and numbers")
    end

    it "password-confirmationがpasswordと一致しなければ登録できない" do
      user = User.new(password: "ww4649ww", password_confirmation: "ww46ww49")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    ##///////////////////////////////////////////////////////////////////////////////////////////////////////name
    it "last-nameが空欄では登録できない" do
      user = User.new(family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "last-nameが全角文字でなければ登録できない" do
      user = User.new(family_name: "tanaka")
      user.valid?
      expect(user.errors[:family_name]).to include("Last name is invalid. Input full-width characters")
    end

    it "first-nameが空欄では登録できない" do
      user = User.new(first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "first-nameが全角文字でなければ登録できない" do
      user = User.new(first_name: "taro")
      user.valid?
      expect(user.errors[:first_name]).to include("First name is invalid. Input full-width characters")
    end

    it "last-name-kanaが空欄では登録できない" do
      user = User.new(family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    it "last-name-kanaが全角カタカナでなければ登録できない" do
      user = User.new(family_name_kana: "田中")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("Last name kana is invalid. Input full-width katakana characters")
    end

    it "first-name-kanaが空欄では登録できない" do
      user = User.new(first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "first-name-kanaが全角カタカナでなければ登録できない" do
      user = User.new(first_name_kana: "太郎")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("First name kana is invalid. Input full-width katakana characters")
    end
    #///////////////////////////////////////////////////////////////////////////////////////////////////////birth
    it "birth-date(年月日)に空欄がある場合は登録できない" do
      user = User.new(birth: "")
      user.valid?
      expect(user.errors[:birth]).to include("can't be blank")
    end
  end
end
