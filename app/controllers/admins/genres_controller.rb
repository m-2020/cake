class Admins::GenresController < ApplicationController

	def index
		@genres = Genre.page(params[:page]).reverse_order
		@genre = Genre.new
	end

	def create
		@genre = Genre.new(genre_params)
		@genre.save
		redirect_to admins_genres_path
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		@genre.update(genre_params)
		redirect_to admins_genres_path
	end

	private
	def genre_params
		params.require(:genre).permit(:name, :display_presence)
	end

end
