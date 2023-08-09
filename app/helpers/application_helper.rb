# frozen_string_literal: true

module ApplicationHelper
  def recipe_author?(author)
    current_user == author
  end
end
