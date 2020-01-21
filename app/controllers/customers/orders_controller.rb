class Customers::OrdersController < ApplicationController

	before_action :authenticate_customer!

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

		@select_button = params[:select_button]

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
		if params[:select_button] == "new_address"
			# アドレス新規登録
			@address = Address.new
			@address.customer_id = current_customer.id
			@address.post_code = @order.post_code
			@address.address = @order.address
			@address.name = @order.name
			@address.save
		end
		# @order_product = current_customer.order_products.new(order_products_params)
		# @order_product.save
		current_customer.cart_products.destroy_all

		redirect_to orders_thanks_path
	end

	def thanks
	end

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@order_products = OrderProduct.all
	end

	private
	def order_params
		params.require(:order).permit(:customer_id, :address_id, :post_code, :address, :postage ,:billing_amount, :payment, :sending_status, :name)

	end

	def order_products_params
		params.require(:order_product).permit(:product_id, :quantity, :price, :cook_status)
	end

end
