class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.string :ingredient_id
      t.integer :quantity

      t.timestamps
    end
  end
end