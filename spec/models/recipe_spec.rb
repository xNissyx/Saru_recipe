require "rails_helper"

RSpec.describe Recipe, type: :model do
  let(:recipe) { FactoryBot.create(:recipe) }

  describe "バリデーション" do
    it "user_id, title, descriptionがある場合、有効である" do
      expect(recipe).to be_valid
    end

    it "user_idがない場合、無効である" do
      recipe.user_id = nil
      expect(recipe).not_to be_valid
    end

    it "titleがない場合、無効である" do
      recipe.title = nil
      expect(recipe).not_to be_valid
    end

    it "descriptionがない場合、無効である" do
      recipe.description = nil
      expect(recipe).not_to be_valid
    end
  end
end
