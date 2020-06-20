class Admins::GenresController < ApplicationController

	def index
		@genres = Genre.all
		@genres = Genre.new
	end

	def edit
	end

	def update
	end

	def create
	end

	def destroy
	end

end
