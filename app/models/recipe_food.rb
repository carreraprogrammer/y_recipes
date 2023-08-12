class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  validates :quantity, presence: true

  def total_quantity
    quantity
  end
  
  def total_price
    quantity * food.price
  end
end
