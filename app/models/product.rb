class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_items
	has_many :order_items

	#ここはカラム名にあわせてidいる？
	attachment :image, destroy: false


	validates :image, presence: true
	validates :name, presence: true
	validates :unit_price, presence: true
	validates :description, presence: true

	#def addTax(product.is_selling,rate)
		#texed_money = (product.is_selling*rate).round
	#end

end