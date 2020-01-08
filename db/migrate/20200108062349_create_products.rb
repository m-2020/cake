class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.integer :price
      t.string :image
      t.text :text
      t.boolean :sale_status

      t.timestamps
    end
  end
end
