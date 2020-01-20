class Product < ApplicationRecord

	belongs_to :genre

    has_many :cart_products, dependent: :destroy
    has_many :order_products, dependent: :destroy

	attachment :image

	def sale_status_str
		self.sale_status ? "販売中" : "売切れ"
	end

	def tax_price
		self.price * 1.08
	end

end
