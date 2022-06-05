class RecipesController < ApplicationController

  #GET /recipes
  def index 
    recipes = Recipe.all 
    render json: recipes
  end

  #POST /recipes
  def create 
    recipe = @current_user.recipes.create!(recipe_params)   #@current_user defined in :authorize method in application controller.  Errors "Not authorized" run UNLESS @current_user
    render json: recipe, status: :created
  end


  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end
end
