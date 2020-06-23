class Customers::CartItemsController < ApplicationController
	layout 'customers'
	def show
		@customer = current_customer #本人の買い物商品のみ表示させる
		@cart_items = current_customer.cart_items #cartはログインのカスタマーだという定義
		@cart_item = CartItem.new
	end

	def create
    	@cart_item = CartItem.new(cart_item_params)
    	@cart_item.customer_id = current_customer.id
    	if @cart_item.save
      	redirect_to customers_customer_cart_item_path
    else
      	session[:cart_item] = @cart_item.attributes.slice(*cart_item_params.keys)
      	@genres = Genre.all
      	@product = Product.find_by(id:@cart_item.product_id)
      	redirect_to product_path(@product.id), flash: {alert: '※個数を選択して下さい'}
    end
  end

	def update
		@customer = current_customer
		@cart_item = Cart_item.find_by(customer_id: @customer.id,id: params[:id])
		@cart_item.update(cart_item_params)
		redirect_to customers_customer_cart_items_path(current_customer.id)
	end

	def destroy
		@customer = current_customer
		@cart_item = Cart_item.find_by(customer_id: @customer.id,id: params[:id])
		@cart_item.destroy
		redirect_to customers_customer_cart_items_path(@customer.id)
	end

	def alldestroy
		@customer = current_customer
		@cart_items = current_customer.cart_items
		@cart_items.destroy_all
		redirect_to customers_customer_cart_items_path(@customer.id)
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:number,:product_id)
	end

end