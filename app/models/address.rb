class Address < ApplicationRecord

	belongs_to :customer

	validates :post_code,
	 presence: true,
	 format: {with: /\A\d{7}\z/}

	validates :address,
	 presence: true

	validates :name,
	 presence: true

	def select_address
		"〒" + self.post_code.to_s + self.address + self.name
	end

	def self.select_customer_address(customer)
		customer.addresses.all.map { |address| "〒" + address.post_code.to_s + "." + address.address.to_s + "." + address.name.to_s}
	end

end
