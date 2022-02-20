require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do

    context 'ユーザー登録できる時' do
    it "passwordが英数字混合であり、6文字以上であれば登録できる" do
      @user.password = "aaa123"
      @user.password_confirmation = "aaa123"
      expect(@user).to be_valid
    end
    it '全ての項目に適切に入力できていれば登録できる' do
      expect(@user).to be_valid
    end
   end

   context 'ユーザー登録できないとき' do

    # nickname
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    # email
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'emailに@が含まれていない場合登録できない' do
      @user.email = 'hoge.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    # password
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'taiki1456'
      @user.password_confirmation = 'yuki1230'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'passwordが全角英字では登録できない' do
      @user.password = 'ｎｏｐｑｒｕｖ'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end
    it 'passwordが半角英数字混合でなければ登録できない(数字のみの場合)' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
    end

    it 'passwordは英字と数字の両方を含めなけば登録できない(英語のみの場合)' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
    end
    it 'passwordとpassword_confirmationが5文字以下では登録できない' do
      @user.password = '11aaa'
      @user.password_confirmation = '11aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    # first_name & last_name
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
    end
    it 'last_nameが全角文字でなければ登録できない' do
      @user.last_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字は不正な値です')
    end
    it 'first_nameが全角文字でなければ登録できない' do
      @user.first_name = 'huga'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は不正な値です')
    end
  
    # first_kana & last_kana
    it 'first_kanaが空では登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(カタカナ)を入力してください")
    end
    it 'last_kanaが空では登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字(カタカナ)を入力してください")
    end
    it 'last_kanaが全角カタカナでなければ登録できない' do
      @user.last_kana = 'あああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字(カタカナ)は不正な値です')
    end
    it 'first_kanaが全角カタカナでなければ登録できない' do
      @user.first_kana = 'ｱｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前(カタカナ)は不正な値です')
    end

    # birthday
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
   end
  end
end