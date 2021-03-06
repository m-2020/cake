class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :post_code
      t.string :address
      t.integer :postage
      t.integer :billing_amount
      t.integer :payment
      t.integer :sending_status

      t.timestamps
    end
  end
end
