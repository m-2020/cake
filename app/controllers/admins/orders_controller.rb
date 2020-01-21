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
		@order = Order.find(params[:id])
		@order.update(order_params)

		if @order.sending_status == "入金確認"
			@order.order_products.each do |product|
				product.update(cooking_status: "製作待ち" )
			end
			redirect_to admins_order_path(@order.id)
		else
        	redirect_to admins_order_path(@order.id)
		end
	end

	def product_update
		@order_product = OrderProduct.find(params[:order_product_id])
		@order_product.update(order_product_params)

		if @order_product.cooking_status == "製作中"
			@order_product.order.update(sending_status: "製作中")
			redirect_to admins_order_path(@order_product.order_id)
		elsif @order_product.cooking_status == "製作完了"
			@order = Order.find(@order_product.order_id)
			# 全て製作完了かを確認するのではなく、一つでも製作完了でない場合はという逆のeach文
			@order.order_products.each do |order_product|
				if order_product.cooking_status != "製作完了"
					redirect_to admins_order_path(@order_product.order_id)
					return
				end
			end
			@order.update(sending_status: "発送準備中")
			redirect_to admins_order_path(@order_product.order_id)
		end
	end

	private
	def order_params
		params.require(:order).permit(:customer_id, :address_id, :post_code, :address, :postage ,:billing_amount, :payment, :sending_status, :name)
	end

	def order_product_params
		params.require(:order_product).permit(:cooking_status)
	end

end
