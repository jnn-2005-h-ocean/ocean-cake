class Admins::GenresController < ApplicationController
	layout 'admins'
	def index
		@genres = Genre.all
		@genre = Genre.new
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
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			redirect_to admins_genres_path
		else
			redirect_to admins_genres_path
		end
	end

	def destroy
	end

	private

	def genre_params
  		params.require(:genre).permit(:name, :is_active)
  	end


end
