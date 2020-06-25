class Customers::OrderItemsController < ApplicationController
	layout 'customers'

	def index
		@orders = Order.where(customer_id: current_customer.id)
	end

	def show
		@order = Order.find(params[:id])
		@order_items = @order.order_items
	end

end
