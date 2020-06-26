class Customers::OrdersController < ApplicationController
	layout 'customers'
	def new #注文情報入力画面
		@customer = Customer.find(params[:customer_id])
		if @customer.cart_items.blank?
 			flash[:notice] = "カートの中身がありません"
			redirect_to customers_customer_cart_item_path(current_customer.id, current_customer.id)
		else
			@order = Order.new
		end
	end


	def confirm #注文を確認する画面
		@carts = current_customer.cart_items
		@customer = current_customer
		@order = Order.new(order_params)

		if  params[:select_address] == "ご自身の住所"
			@order.shipping_postal_code = current_customer.postal_code
    		@order.shipping_address = current_customer.address
    		@order.shipping_name = current_customer.family_name + current_customer.first_name

    elsif params[:select_address] == "登録済み住所から選択"
    	@shipping_address = Address.find(params[:page][:name])
			@order.shipping_postal_code = @shipping_address.shipping_postal_code
			@order.shipping_address = @shipping_address.shipping_address
			@order.shipping_name = @shipping_address.shipping_name

		elsif params[:select_address] ==  "新しいお届け先"
			@shipping_address = Address.new(shipping_address_params)
			@shipping_address.customer_id = current_customer.id
			@shipping_address.save
			@order.shipping_postal_code = @shipping_address.shipping_postal_code
			@order.shipping_address = @shipping_address.shipping_address
			@order.shipping_name = @shipping_address.shipping_name
		end
	end

	def create #注文情報を保存する
		@order = Order.new(order_params)
		@customer = current_customer
		@order.customer_id = current_customer.id
		@carts = current_customer.cart_items

		if @order.save
	#カートの中身をOrderItemテーブルにeachで格納
			current_customer.cart_items.each do |cart|
				order_item = OrderItem.new(order_id: @order.id, product_id: cart.product_id, number: cart.number, purchase_price: cart.number * cart.product.unit_price)
				order_item.save
			end

			current_customer.cart_items.destroy_all
			redirect_to complete_customers_customer_order_path(current_customer.id,@order.id)
		else
	#注文情報（orderdetail）にvalidatesをかけてあるので未入力の場合、ここでredirectを実行
			flash[:notice] = "未入力の情報があります"
			redirect_to confirm_customers_customer_order_path(current_customer.id, @order.id)
		end
	end

	def complete #注文ありがとうございました画面
		@order = Order.find(params[:id])
    	@order_item = @order.order_items
	end


private

	def order_params
		params.require(:order).permit(:shipping_postal_code,:shipping_name,:shipping_address,:shipping_fee,:total_fee,:payment_method,:order_status)
	end

	def shipping_address_params
		params.require(:address).permit(:address_id, :shipping_postal_code, :shipping_address, :shipping_name)
	end

	def order_item_params
		params.require(:order_item).permit(:product_id,:number,:purchase_price)
	end


end
