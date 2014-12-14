class RemoveIngredientIdFromRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :ingredient_id, :string
  end
end
