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
			render
		end
	end


	def destroy
	end

end
