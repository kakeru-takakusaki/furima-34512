require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '保存できる場合' do
      
    end
    
    context '保存できない場合' do
      it "ニックネームが必須であること" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "ニックネームが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Nickname has already been taken")
      end
      it "メールアドレスが必須であること" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは、@を含む必要があること" do
        @user.email = "test-gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードが必須であること" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは、６文字以上での入力が必須であること" do
        @user.password = "a1234"
        @user.password_confirmation = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは、半角英数字混合での入力が必須であること(半角数字のみ)" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "パスワードは、半角英数字混合での入力が必須であること(半角英字のみ)" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "パスワードは確認用を含めて２回入力すること(確認用なし)" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
        @user.password = "test123"
        @user.password_confirmation = "sample123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "ユーザー本名は、名字と名前がそれぞれ必須であること(名字なし)" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "ユーザー本名は、名字と名前がそれぞれ必須であること(名前なし)" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名字)" do
        @user.family_name = "Tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name には全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名前)" do
        @user.first_name = "Tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it "ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること(名字なし)" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること(名前なし)" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること(名字)" do
        @user.family_name_kana = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana には全角カタカナで入力してください")
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること(名前)" do
        @user.first_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana には全角カタカナで入力してください")
      end
      it "生年月日が必須であること" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end