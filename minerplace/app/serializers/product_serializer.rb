class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :sku, :price, :currency, :inventory, :reserved, :sold
  belongs_to :category_id
end