class OrderItem < ApplicationRecord

	belongs_to :product
	belongs_to :order

	enum making_status:{cannot: 0, waiting: 1, doing: 2, done: 3}

end
