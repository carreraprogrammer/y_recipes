# frozen_string_literal: true

class Food < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipes, trough: :recipe_foods
end
