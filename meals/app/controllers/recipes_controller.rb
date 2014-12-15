class RecipesController < ApplicationController
  def create
    recipe = Recipe.new
    recipe.name = params[:recipe][:name]
    recipe.description = params[:recipe][:description]
    recipe.save

    params[:recipe][:ingredient][:name].each do |name|
      if name.blank?
        next
      end
      
      if Ingredient.where(name: name).blank?
        ingredient = Ingredient.new
        ingredient.name = name
        ingredient.save
      else
        ingredient = Ingredient.where(name: name).first
      end

      recipe_ingredient = RecipeIngredient.new
      recipe_ingredient.recipe_id = recipe.id
      recipe_ingredient.ingredient_id = ingredient.id
      recipe_ingredient.quantity = 1
      recipe_ingredient.save
    end
  end
end
