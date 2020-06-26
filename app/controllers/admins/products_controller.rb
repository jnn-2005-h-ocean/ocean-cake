class Admins::ProductsController < ApplicationController
	layout 'admins'
	before_action :authenticate_admin!
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admins_products_path(@product.id), notice: "successfully created product!"
		else
  			render 'new'
  		end
  	end

	def index
		@products = Product.all
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
			redirect_to admins_product_path(@product.id), notice: "successfully updated product!"
		else
			render action: :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admins_products_path
	end

	private

	def product_params
		params.require(:product).permit(:name, :genre_id, :image, :description, :unit_price, :is_selling)
	end

end
