class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :post_code
      t.string :address
      t.integer :postage
      t.integer :billing_amount
      t.boolean :payment
      t.integer :sending_status

      t.timestamps
    end
  end
end
