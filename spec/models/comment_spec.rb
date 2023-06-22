require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.create(:comment) }

  describe 'バリデーション' do
    it 'user_id, recipe_id, content, scoreがある場合、有効である' do
      expect(comment).to be_valid
    end

    it 'contentがない場合、無効である' do
      comment.content = nil
      expect(comment).not_to be_valid
    end

    it 'scoreがない場合、無効である' do
      comment.score = nil
      expect(comment).not_to be_valid
    end

    it 'contentが300文字を超える場合、無効である' do
      comment.content = "a" * 301
      expect(comment).not_to be_valid
    end

    it 'scoreが0未満である場合、無効である' do
      comment.score = -1
      expect(comment).not_to be_valid
    end

    it 'scoreが5を超える場合、無効である' do
      comment.score = 6
      expect(comment).not_to be_valid
    end
  end
end