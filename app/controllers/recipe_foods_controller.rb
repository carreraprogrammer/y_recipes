class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe_foods = RecipeFood.all
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show; end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
  end

  # GET /recipe_foods/1/edit
  def edit; end

  # POST /recipe_foods or /recipe_foods.json
  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        flash[:notice] = 'Food added to recipe'
      else
        flash[:alert] = @recipe_food.errors.full_messages.join(', ')
      end
      format.html { redirect_to request.referrer }
    end
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    if @recipe_food.update(recipe_food_params)
      flash[:notice] = 'Ingredient updated'
    else
      flash[:alert] = @recipe_food.errors.full_messages.join(', ')
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    if @recipe_food.destroy
      flash[:notice] = 'Food removed from recipe'
    else
      flash[:alert] = @recipe_food.errors.full_messages.join(', ')
    end
    redirect_to request.referrer
  end

  def shopping_list
    @recipe_foods = RecipeFood
      .includes(:food, :recipe)
      .where(recipes: { user_id: current_user.id })
      .group_by(&:food_id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :food_id, :quantity)
  end
end
