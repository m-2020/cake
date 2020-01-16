class Customers::OrdersController < ApplicationController

	def new
		@order = Order.new
		@customer = current_customer
	end

	def judgement
		@customer = current_customer
		# @customer_address = @customer.address
		@cart_products = current_customer.cart_products
		@order = Order.new(order_params)
	end

	def create
		@order = Order.new(order_params)
		@order.customer_id = current_customer.id
		@order.save
		redirect_to orders_thanks_path
	end



	def thanks
	end


	private
	def order_params
		params.require(:order).permit(:customer_id, :address_id, :post_code, :address, :postage ,:billing_amount, :payment, :sending_status, :name)

	end
end
