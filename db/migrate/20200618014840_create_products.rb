class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

    t.string :name, null: false
    t.integer :genre_id, null: false
    t.string :image_id, null: false
    t.text :description, null: false
    t.integer :unit_price, null: false
    t.boolean :is_selling, default: true, null: false

    t.timestamps
    end
  end
end
