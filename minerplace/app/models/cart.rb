class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  accepts_nested_attributes_for :line_items

  def update_total_price
    self.total_price = line_items.sum(&:total_price)
  end
end
