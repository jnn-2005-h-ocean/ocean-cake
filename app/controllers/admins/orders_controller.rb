class Admins::OrdersController < ApplicationController
	layout 'admins'
	before_action :authenticate_admin!

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@order_items = @order.order_items
	end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			flash[:update] = "注文ステータスを更新しました"
			redirect_to admins_order_path(@order.id)
		else
			@order = Order.find(params[:id])
			@order_items = @order.order_items
			render "show"
		end
	end

	private

  	def order_params
  		params.require(:order).permit(:order_status)
  	end
end