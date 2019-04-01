class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'name')
    @recipe.ingredients.build(quantity: 'quantity')

  end

  def create
    @recipe = Recipe.new(recipes_params)
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  private

  def recipes_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :id,
        :name,
        :quantity
      ]
    )
  end
end
