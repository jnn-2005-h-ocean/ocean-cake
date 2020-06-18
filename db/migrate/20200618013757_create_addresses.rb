class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

    t.integer :customer_id
    t.string :shipping_name
    t.string :shipping_postal_code
    t.string :shipping_address

    t.timestamps
    end
  end
end
