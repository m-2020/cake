class Customers::CartProductsController < ApplicationController

	before_action :authenticate_customer!

	def create
		# cart_prodectのproduct_idカラムが空の場合
		if current_customer.cart_products.where(product_id: params[:cart_product][:product_id]).empty?
			@cart_product = CartProduct.new(cart_product_params)
			@cart_product.customer_id = current_customer.id
			@cart_product.save
		# cart_productのproduct_idカラムが空でない場合
		else
			@cart_product = current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id])
			@cart_product.update(quantity: @cart_product.quantity+params[:cart_product][:quantity].to_i)
		end
		redirect_to cart_products_path
	end

	def index
		@cart_products = current_customer.cart_products
	end



	def update
		cart_product = CartProduct.find(params[:id])
        cart_product.update(cart_product_params)
        redirect_to cart_products_path
	end

	def destroy
		cart_product = CartProduct.find(params[:id])
    	cart_product.destroy
    	redirect_to cart_products_path
	end

	def destroy_all
		cart_product = CartProduct.all
    	cart_product.destroy_all
    	redirect_to cart_products_path
	end


	private
	def cart_product_params
		params.require(:cart_product).permit(:product_id, :quantity)
	end
end
