class Admins::OrderItemsController < ApplicationController
	layout 'admins'
	before_action :authenticate_admin!

	def update
		order_item = OrderItem.find(params[:id])
		if order_item.update(order_item_params)
			flash[:update] = "制作ステータスを更新しました"
			redirect_to admins_order_path(order_item.order)
		else
			render "show"
		end
	end


	private

	def order_item_params
  		params.require(:order_item).permit(:making_status)
  	end

end
