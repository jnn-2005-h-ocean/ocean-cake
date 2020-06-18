class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

    t.string :name
    t.integer :genre_id
    t.string :image_id
    t.text :description
    t.integer :unit_price
    t.boolean :is_selling, default: true

    t.timestamps
    end
  end
end
