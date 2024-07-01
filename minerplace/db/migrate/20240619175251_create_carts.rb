class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :carts, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.decimal :total_price, precision: 10, scale: 2, default: 0.0
      t.string :customer_email

      t.timestamps
    end
  end
end
