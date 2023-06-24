require "rails_helper"

RSpec.describe Admin, type: :model do
  let(:admin) { FactoryBot.build(:admin) }
  let(:duplicate_admin) { FactoryBot.build(:admin, email: admin.email) }

  describe "バリデーション" do
    it "必要な事項を入力した場合、有効である" do
      expect(admin).to be_valid
    end

    it "メールアドレスがない場合、無効である" do
      admin.email = nil
      expect(admin).not_to be_valid
    end

    it "メールアドレスが一意でない場合、無効である" do
      admin.save
      duplicate_admin.save
      expect(duplicate_admin).not_to be_valid
    end

    it "パスワードが一致しない場合、無効である" do
      admin.password_confirmation = "different_password"
      expect(admin).not_to be_valid
    end
  end
end
