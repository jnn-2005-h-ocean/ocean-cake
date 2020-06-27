class Customers::OrderItemsController < ApplicationController
	layout 'customers'
  before_action :authenticate_customer!

	def index
		@orders = Order.where(customer_id: current_customer.id).all.order("id DESC")
	end

	def show
		@order = Order.find(params[:id])
		@order_items = @order.order_items
	end

end
