class Admins::OrdersController < ApplicationController

	def top
		@count = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count

	end

	def index
		@orders = Oeder.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
	
	end

	private
	def order_params
		params.require(:order).permit(:created_at)
	end

end
