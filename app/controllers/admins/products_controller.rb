class Admins::ProductsController < ApplicationController

	def index
		@products = Product.all
		@product = Product.new
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save
		render :index
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
	end

	private
	def product_params
		params.require(:product).permit(:genre_id, :name, :price, :image, :text, :sale_status)
	end

end
