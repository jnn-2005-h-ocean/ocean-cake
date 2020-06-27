class Customers::CartItemsController < ApplicationController
	layout 'customers'
  before_action :authenticate_customer!
	def show
		@customer = current_customer #本人の買い物商品のみ表示させる
		@cart_items = current_customer.cart_items #cartはログインのカスタマーだという定義
		@cart_item = CartItem.new
	end

	def create
		@cart = CartItem.new(cart_item_params)
	    @cart2 = CartItem.find_by(customer_id: current_customer.id, product_id: @cart.product_id )

	    if @cart2.blank?
	      @cart.customer_id= current_customer.id
	      @cart.save
	      redirect_to controller: 'cart_items', action: 'show', id: current_customer.id
	    else
	      @cart2.number += @cart.number
	      @cart2.save
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