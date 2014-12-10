class RecipesController < ApplicationController
  def index
    @recipies = Recipe.all
  end

  def create
    @recipe = Recipe.create params[:post]
    redirect_to posts_path
  end
end
