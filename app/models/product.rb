class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_items
	has_many :order_items

	#ここはカラム名にあわせてidいる？
	attachment :image, destroy: false

	#def addTax(product.is_selling,rate)
		#texed_money = (product.is_selling*rate).round
	#end

end
