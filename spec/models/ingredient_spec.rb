require "rails_helper"

RSpec.describe Ingredient, type: :model do
  let(:ingredient) { FactoryBot.create(:ingredient) }

  describe "バリデーション" do
    it "recipe_id, name, quantityがある場合、有効である" do
      expect(ingredient).to be_valid
    end

    it "contentがない場合、無効である" do
      ingredient.name = nil
      expect(ingredient).not_to be_valid
    end

    it "scoreがない場合、無効である" do
      ingredient.quantity = nil
      expect(ingredient).not_to be_valid
    end
  end
end
