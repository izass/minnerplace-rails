class CartSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :customer_email
  has_many :line_items
end
