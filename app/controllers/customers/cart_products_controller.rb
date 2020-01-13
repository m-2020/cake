class Customers::CartProductsController < ApplicationController

	before_action :authenticate_customer!

	def index
		@cart_products = CartProduct.all
		@product = Product.new
	end

	def create
		@cart_product = CartProduct.new(cart_product_params)
		@cart_product.save
		redirect_to cart_products_path
	end

	def update
		cart_product = CartProduct.find(params[:id])
        cart_product.update(cart_product_params)
        redirect_to cart_products_path
	end

	def destroy
	end

	def destroy_all
	end


	private
	def cart_product_params
		params.require(:cart_product).permit(:product_id, :quantity)
	end
end