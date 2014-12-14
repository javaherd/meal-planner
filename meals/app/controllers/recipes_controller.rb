class RecipesController < ApplicationController
  def create
    recipe = Recipe.new
    recipe.name = params[:recipe][:name]
    recipe.description = params[:recipe][:description]
    recipe.save

    ingredient = Ingredient.new
    ingredient.name = params[:recipe][:ingredient][:name]
    Rails.logger.debug(ingredient.name)
    ingredient.save

    recipe_ingredient = RecipeIngredient.new
    recipe_ingredient.recipe_id = recipe.id
    recipe_ingredient.ingredient_id = ingredient.id
    recipe_ingredient.quantity = 1
    recipe_ingredient.save
  end
end
