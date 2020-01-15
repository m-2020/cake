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

end
