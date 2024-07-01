class CreateDiscountCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :discount_codes do |t|
      t.string :code, null: false
      t.unique_constraint [:code]
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :discount_type, null: false, default: "fixed"
      t.datetime :expires_at
      t.integer :usage_limit
      t.integer :times_used, default: 0

      t.timestamps
    end
  end
end
