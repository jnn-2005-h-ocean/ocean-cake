class Admins::ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
	end

	def index
		@product = product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to @product, notice: "successfully updated product"
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admins_products
	end

	private

	def product_params
		params.require(:product).permit(:name, :description, :unit_price)
	end

end
