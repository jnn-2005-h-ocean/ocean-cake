class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|


    t.integer :customer_id, null: false
    t.string :shipping_name, null: false
    t.string :shipping_postal_code, null: false
    t.string :shipping_address, null: false
    t.integer :payment_method, null: false
    t.integer :shipping_fee, default: 800, null: false
    t.integer :total_fee, null: false
    t.integer :order_status, default: 0, null: false

    t.timestamps
    end
  end
end
