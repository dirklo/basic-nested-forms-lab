class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.new
    @recipe.ingredients.new
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:title, :ingredients_attributes => [:name, :quantity, :id]))
    if @recipe.save
      redirect_to @recipe
    end
  end

end
