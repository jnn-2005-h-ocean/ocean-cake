class Admins::GenresController < ApplicationController

	def index
		@genres = Genre.all
		@genres = Genre.new
	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to admins_genres_path
		else
			redirect_to admins_genres_path
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def genre_params
  		params.require(:genre).permit(:name, :is_active)
  	end

end
