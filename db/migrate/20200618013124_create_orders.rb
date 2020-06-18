class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|


    t.integer :customer_id
    t.string :shipping_name
    t.string :shipping_postal_code
    t.string :shipping_address
    t.integer :payment_method
    t.integer :shipping_fee, default: 800
    t.integer :total_fee
    t.integer :order_status, default: 0

    t.timestamps
    end
  end
end
