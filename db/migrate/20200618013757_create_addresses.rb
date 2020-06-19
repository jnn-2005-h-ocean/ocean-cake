class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

    t.integer :customer_id, null: false
    t.string :shipping_name, null: false
    t.string :shipping_postal_code, null: false
    t.string :shipping_address, null: false

    t.timestamps
    end
  end
end
