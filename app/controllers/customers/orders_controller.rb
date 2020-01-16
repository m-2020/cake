class Customers::OrdersController < ApplicationController

	def new
		@order = Order.new
		@customer = current_customer
	end

	def judgement
		@order = Order.new(odrder_params)
		@customer = current_customer
	end

	def create
		@order = Order.new(odrder_params)
		@customer = current_customer
		@order.save
		redirect_to orders_thanks_path
	end

	private
	def order_params
		params.require(:order).permit(:customer_id, :address_id, :post_code, :address, :postage ,:billing_amount, :payment, :sending_status, :name)

	end
end
