class Customers::CartItemsController < ApplicationController
	layout 'customers'
	def show
		@customer = current_customer #本人の買い物商品のみ表示させる
		@cart_items = current_customer.cart_items #cartはログインのカスタマーだという定義
		@cart_item = CartItem.new
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		#新しく入れるcart_itemと今まで入っているcart_itemを存在しているかの確認
		if current_customer.cart_items.find_by(product_id: @cart_item.product_id)
    		redirect_to controller: 'cart_items', action: 'show', id: current_customer.id,alert:"選択した商品はすでにカートに入っています。"
    	else
    		@cart_item.customer_id = current_customer.id
    		@cart_item.save
      		redirect_to controller: 'cart_items', action: 'show', id: current_customer.id
    	end

  	end

	def update
		@customer = current_customer
		@cart_item = CartItem.find_by(customer_id: @customer.id,id: params[:id])
		@cart_item.update(cart_item_params)
		redirect_to controller: 'cart_items', action: 'show', id: current_customer.id
	end

	def destroy
		@customer = current_customer
		@cart_item = CartItem.find_by(customer_id: @customer.id,id: params[:id])
		@cart_item.destroy
		redirect_to controller: 'cart_items', action: 'show', id: current_customer.id
	end

	def alldestroy
		@customer = current_customer
		@cart_items = current_customer.cart_items
		@cart_items.destroy_all
		redirect_to controller: 'cart_items', action: 'show', id: current_customer.id
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:number,:product_id)
	end

end