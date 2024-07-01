class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :product_id, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_save :set_prices
  after_save :update_cart_total_price
  after_save :update_product_reserved
  
  after_destroy :update_cart_total_price
  after_destroy :update_product_reserved

  def total_price
    unit_price * quantity
  end

  private

  def set_prices
    self.unit_price = product.price
    self.total_price = (unit_price * quantity)
  end

  def update_product_reserved
    if saved_change_to_quantity? || destroyed?
      product.update_reserved_count
    end
  end

  def update_cart_total_price
    cart.update_total_price
    cart.save
  end
end
