class Address < ApplicationRecord

	belongs_to :customer

	validates :post_code, format: {with: /\A\d{7}\z/}

end
