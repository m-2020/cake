class AddEntryStatusToCustomers < ActiveRecord::Migration[5.2]
  def change
  	change_column :customers, :entry_status, :boolean, :default =>true
  end
end
