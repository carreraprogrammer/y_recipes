# frozen_string_literal: true

module ApplicationHelper
  def recipe_author?(author)
    current_user == author
  end

  def recipes?
    current_user.recipes.count.positive?
  end

  def capitalize_text(text)
    text.upcase
  end
end
