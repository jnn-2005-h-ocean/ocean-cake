class Customers::ProductsController < ApplicationController
	layout 'customers'

	def index
		@products = Product.all
		@genres = Genre.all
	end

	def show
		@product = Product.find(params[:id])
		@genres = Genre.all
	end

	def genre_search
		@genres = Genre.all
		@genre = Genre.find(params[:id])
		@products = Product.where(genre_id:, params[:id])
	end

	private

	def product_params
		params.require(:product).permit(:name, :genre_id, :image, :description, :unit_price, :is_selling)
	end

	def genre_params
  		params.require(:genre).permit(:name, :is_active)
  	end


end
