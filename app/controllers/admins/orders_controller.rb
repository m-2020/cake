class Admins::OrdersController < ApplicationController

	def top
		@count = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count

	end

	def index
		@orders = Order.page(params[:page]).reverse_order
	end

	def show
		@order = Order.find(params[:id])
	end

	def update

	end

	private
	def order_params
		params.require(:order).permit(:customer_id, :address_id, :post_code, :address, :postage ,:billing_amount, :payment, :sending_status, :name)

	end

end
