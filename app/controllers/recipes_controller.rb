class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    #binding.pry
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def create
    var = Recipe.create(recipe_params)
    redirect_to recipe_path(var)
  end

  def recipe_params
      params.require(:recipe).permit(:title, ingredients_attributes: [ :name, :quantity])
  end
end
