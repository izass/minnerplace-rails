class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items

  def update_reserved_count
    self.reserved = line_items.sum(:quantity)
    save!
  end
end
