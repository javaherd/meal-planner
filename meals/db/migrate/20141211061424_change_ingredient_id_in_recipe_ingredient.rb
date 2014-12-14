class ChangeIngredientIdInRecipeIngredient < ActiveRecord::Migration
  def up
    change_column :recipe_ingredients, :ingredient_id, :integer
  end

  def down
    change_column :recipe_ingredients, :ingredient_id, :string
  end
end
