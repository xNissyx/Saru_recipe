require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { FactoryBot.build(:tag) }

  describe 'バリデーション' do
    it 'FactoryBotが有効である' do
      expect(tag).to be_valid
    end

    it 'nameがない場合、無効である' do
      tag.name = nil
      expect(tag).not_to be_valid
    end
  end
end
