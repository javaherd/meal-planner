class RemoveRecipeIdFromIngredient < ActiveRecord::Migration
  def change
    remove_column :ingredients, :recipe_id, :string
  end
end
