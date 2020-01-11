class Product < ApplicationRecord

	belongs_to :genre

    has_many :carts, dependent: :destroy
    has_many :order_products, dependent: :destroy

	attachment :image

end
