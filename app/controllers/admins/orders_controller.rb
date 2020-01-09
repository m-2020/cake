class Admins::OrdersController < ApplicationController
	def top
		@orders = Order.count
	end

end
