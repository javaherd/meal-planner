class RecipesController < ApplicationController
  def create
    recipe = Recipe.new 
    recipe.name = params[:recipe][:name]
    recipe.description = params[:recipe][:description]
    recipe.save
  end
end
