class Order < ApplicationRecord

	belongs_to :customer

	has_many :order_products, dependent: :destroy

	enum payment: {クレジットカード: 0, 銀行振込: 1}

	enum sending_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済: 4}

	def address_all_id
		'〒' + self.post_code + '/' + self.address + '/' + self.last_name + ' ' + self.last_name
	end

end
