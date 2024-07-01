class LineItemSerializer < ActiveModel::Serializer
  attributes :quantity, :unit_price, :total_price
  belongs_to :product
  belongs_to :cart
end