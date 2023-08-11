# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods
  # has_many :food
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 50 }
  validates :preparation_time_minutes, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time_minutes, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :description, length: { minimum: 10 }
  validates :public, inclusion: { in: [true, false] }
end
