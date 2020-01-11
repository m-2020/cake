class Admins::OrdersController < ApplicationController

	def top
		@orders = Order.count

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
