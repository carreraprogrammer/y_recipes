module ApplicationHelper
  def current_user
    User.find_by(id: params[:user_id])
  end 

  def recipe_author?
    current_user == @recipe.user
  end
end
