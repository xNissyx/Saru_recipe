require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  let(:duplicate_user) { FactoryBot.build(:user, email: user.email) }

  describe 'バリデーション' do
    it '必要な事項を入力した場合、有効である' do
      expect(user).to be_valid
    end

    it '名前がない場合、無効である' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'メールアドレスがない場合、無効である' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'メールアドレスが一意でない場合、無効である' do
      user.save
      duplicate_user.save
      expect(duplicate_user).not_to be_valid
    end

    it 'パスワードが一致しない場合、無効である' do
      user.password_confirmation = user.password.upcase
      expect(user).not_to be_valid
    end
  end

  describe '.guest' do
    let(:guest_user) { User.guest }

    it 'メールアドレスが"guest@example.com"である' do
      expect(guest_user.email).to eq('guest@example.com')
    end

    it 'パスワードがnilではない' do
      expect(guest_user.password).not_to be_nil
    end

    it '名前が"ゲストユーザー"である' do
      expect(guest_user.name).to eq('ゲストユーザー')
    end
  end
end
