class Admins::OrderItemsController < ApplicationController
	layout 'admins'
	before_action :authenticate_admin!


	def update
		@order_item = OrderItem.find(params[:id])
		@order_item.update(order_item_params)
		@order = @order_item.order

		if @order_item.making_status == "制作中"
			@order.update(order_status: 2)
		end

		if @order_item.making_status == "制作完了"
			@order.update(order_status: 3)
		end

		redirect_to admins_order_path(@order.id)

	end



	private

	def order_item_params
  		params.require(:order_item).permit(:making_status)
  	end

  	def order_params
		params.require(:order).permit(:order_status)
	end

end