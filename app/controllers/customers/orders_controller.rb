class Customers::OrdersController < ApplicationController

	def new
		@order = Order.new
		@customer = current_customer
		# @select_address = current_customer.addresses.all.map { |address| address.post_code.to_s + " " + address.address.to_s + address.name.to_s}
		@select_address_form = Address.select_customer_address(current_customer)

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
			@select_address = Address.find_by(address: params[:select_address].split(".")[1])
			# select_address = Address.find(params[:order][:address_id])
			@order.address = @select_address.address
			@order.post_code = @select_address.post_code
			@order.name = @select_address.name
			# binding.pry
		end
	end

	def create
		@cart_products = current_customer.cart_products
		@order = current_customer.orders.new(order_params)

		@order.save

		@cart_products.each do |product|
			@product = OrderProduct.new
			@product.order_id = @order.id
			@product.product_id = product.product_id
			@product.quantity = product.quantity
			@product.price = product.product.price
			@product.save
		end

		# @order_product = current_customer.order_products.new(order_products_params)
		# @order_product.save
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

	def order_products_params
		params.require(:order_product).permit(:product_id, :quantity, :price, :cook_status)
	end

end
