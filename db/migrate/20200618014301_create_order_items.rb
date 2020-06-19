class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|


    t.integer :order_id, null: false
    t.integer :product_id, null: false
    t.integer :number, null: false
    t.integer :purchase_price, null: false
    t.integer :making_status, default: 0, null: false

    t.timestamps
    end
  end
end
