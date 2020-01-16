class CartProduct < ApplicationRecord

	belongs_to :customer
	belongs_to :product

	validates :quantity,
	 presence: true

	def tax_price
		self.product.price * 1.1
	end


end
