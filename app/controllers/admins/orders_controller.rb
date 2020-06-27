class Admins::OrdersController < ApplicationController
	layout 'admins'
	before_action :authenticate_admin!

	def index
		@orders = Order.all.order("id DESC")#降順の設定もしています
	end

	def show
		@order = Order.find(params[:id])
		@order_items = @order.order_items
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		@order_items = @order.order_items
		if @order.order_status == "入金確認"

			@order_items.each do |order_items|

	       	order_items.update(making_status: 1)
	       end
	    else
	    	@order.update(order_params)
    	end
    	redirect_to admins_order_path(@order.id)

	end


	private

  	def order_params
  		params.require(:order).permit(:order_status)
  	end

  	def order_item_params
  		params.require(:order_item).permit(:making_status,:order_id)
  	end
end