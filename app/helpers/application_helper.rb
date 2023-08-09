module ApplicationHelper
  def recipe_author?
    current_user == @recipe.user
  end
end
