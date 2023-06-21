class RemoveCalorieFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :calorie, :integer
  end
end
