class DeleteCartProduct < ActiveRecord::Migration[5.2]
  def change
  	drop_table :cart_products
  end
end
