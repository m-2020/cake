class Customers::OrdersController < ApplicationController

	def new
		@order = Order.new
		@customer = current_customer
	end

	def judgement
		@customer = current_customer
		# @customer_address = @customer.address
		@cart_products = current_customer.cart_products
		@order = current_customer.orders.new(order_params)
		if params[:select_button] == "customer_address"
			@order.address = current_customer.address
			@order.post_code = current_customer.post_code
			@order.name = current_customer.last_name + current_customer.first_name
		elsif params[:select_button] == "new_address"
			params[:order]
		elsif params[:select_button] == "addresses"
			select_address = Address.find(params[:order][:address_id])
			@order.address = select_address.address
			@order.post_code = select_address.post_code
			@order.name = select_address.name
		end
	end

	def create
		@order = current_customer.orders.new(order_params)
		binding.pry
		@order.save
		redirect_to orders_thanks_path
	end

	def thanks
	end

	def index
		@orders = Order.all
	end

	private
	def order_params
		params.require(:order).permit(:customer_id, :address_id, :post_code, :address, :postage ,:billing_amount, :payment, :sending_status, :name)

	end
end
