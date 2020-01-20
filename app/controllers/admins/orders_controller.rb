class Admins::OrdersController < ApplicationController

	def top
		@count = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count

	end

	def index
		@orders = Order.page(params[:page]).reverse_order
	end

	def show
		@order_products = OrderProduct.all
		@order = Order.find(params[:id])
	end

	def update

	end

	private
	def order_params
		params.require(:order).permit(:created_at)
	end

end
