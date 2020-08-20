require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nameが6文字以下で登録できる" do
        @user.name = "ああああ"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000000"
        @user.password_confirmation = "000000000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "nameが7文字以上であれば登録できない" do
        @user.name = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is too long (maximum is 6 characters)")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "emailに@が含まれなければ登録できない" do
        @user.email = "aaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email does not contain @")
      end
      it "名前が全角でなければ登録できない" do
        @user.name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is not full-width")
      end
    end
  end
end
