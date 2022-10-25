class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validate :limit_stock

  def total_price
    self.quantity * self.product.price
  end

  private
  def limit_stock
    unless quantity <= product.quantity
      errors.add(:quantity, "Se ha alcanzado el máximo de articulos disponibles") 
    end
  end
end
