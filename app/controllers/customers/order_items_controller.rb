class Customers::OrderItemsController < ApplicationController
	layout 'customers'

	def index
		@orders = Order.where(customer_id: current_customer.id).order(created_at: "DESC")

	end

	def show
		@order = Order.find(params[:id])
		@order_details = OrderDetail.where(order_id: params[:id])
	end
end
