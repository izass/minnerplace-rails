class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :sku
      t.decimal :price
      t.string :currency
      t.integer :inventory, null: false, default: 0
      t.integer :reserved, null: false, default: 0
      t.integer :sold, null: false, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
